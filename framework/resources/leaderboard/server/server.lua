-- Leaderboard Server-side Code

local function getESX()
    if not ESX then
        pcall(function()
            ESX = exports['es_extended']:getSharedObject()
        end)
    end
    return ESX
end

-- Ensure gangs table has kills and turfs columns
CreateThread(function()
    Wait(5000)
    -- Try to add columns if they don't exist (safe to run multiple times)
    pcall(function()
        MySQL.query.await('ALTER TABLE gangs ADD COLUMN IF NOT EXISTS kills INT(11) DEFAULT 0')
    end)
    pcall(function()
        MySQL.query.await('ALTER TABLE gangs ADD COLUMN IF NOT EXISTS turfs INT(11) DEFAULT 0')
    end)
end)

-- Get gang leaderboard data from database
local function getGangLeaderboard()
    local gangs = nil

    -- Try with kills/turfs first, fallback to basic query
    local success = pcall(function()
        gangs = MySQL.query.await('SELECT name, label, kills, turfs FROM gangs ORDER BY turfs DESC, kills DESC')
    end)

    if not success or not gangs then
        -- Fallback: query without kills/turfs columns
        pcall(function()
            gangs = MySQL.query.await('SELECT name, label FROM gangs ORDER BY name ASC')
        end)
    end

    local result = {}
    if gangs then
        for _, gang in pairs(gangs) do
            result[#result + 1] = {
                name = gang.label or gang.name,
                kills = gang.kills or 0,
                turfs = gang.turfs or 0
            }
        end
    end

    return result
end

-- Client requests leaderboard data
lib.callback.register('leaderboard:getData', function(source)
    return getGangLeaderboard()
end)

-- Update gang kills in database
RegisterNetEvent('redzones:killed', function(killerId, reward, zoneLabel, headshot)
    local source = source
    local esx = getESX()
    if not esx then return end

    -- Give money to the killer
    local killer = esx.GetPlayerFromId(killerId)
    if killer then
        killer.addMoney(reward)
        TriggerClientEvent('showNotification', killerId, 'Kill reward: $' .. reward, 'skull', '#0EA5E9')

        -- Update killer's kill count in their gang
        local killerState = Player(killerId).state
        local killerGang = killerState.gang
        if killerGang and killerGang ~= '' and killerGang ~= 'none' then
            pcall(function()
                MySQL.update.await('UPDATE gangs SET kills = kills + 1 WHERE name = ?', { killerGang })
            end)
        end

        -- Send updated kill count to the killer's redzone UI
        local kills = Player(killerId).state.redzoneKills or 0
        kills = kills + 1
        Player(killerId).state:set('redzoneKills', kills, true)

        TriggerClientEvent('redzones:kills', killerId, kills, headshot)
    end

    -- Broadcast updated leaderboard to all clients
    local leaderboard = getGangLeaderboard()
    TriggerClientEvent('gangs:change', -1, leaderboard)
end)

-- Redzone action handler
RegisterNetEvent('redzones:action', function(action, zone)
    local source = source
    local esx = getESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    if action == 'enter' then
        -- Reset kill counter for this player
        Player(source).state:set('redzoneKills', 0, true)

        -- Give zone weapon if configured
        local Redzones = Zen.Config and Zen.Config.Redzones
        if Redzones and Redzones.Zones and Redzones.Zones[zone] then
            local zoneData = Redzones.Zones[zone]
            if zoneData.weapon then
                TriggerClientEvent('redzones:give:weapon', source, 'enter', zoneData.weapon)
            end
        end
    elseif action == 'exit' then
        -- Remove zone weapon
        local Redzones = Zen.Config and Zen.Config.Redzones
        if Redzones and Redzones.Zones and Redzones.Zones[zone] then
            local zoneData = Redzones.Zones[zone]
            if zoneData.weapon then
                TriggerClientEvent('redzones:give:weapon', source, 'exit', zoneData.weapon)
            end
        end
    end
end)
