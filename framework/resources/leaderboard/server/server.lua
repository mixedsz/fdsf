-- Leaderboard Server-side Code

local function getESX()
    if not ESX then
        pcall(function()
            ESX = exports['es_extended']:getSharedObject()
        end)
    end
    return ESX
end

-- Get gang leaderboard data from database
local function getGangLeaderboard()
    local gangs = MySQL.query.await('SELECT name, label, kills, turfs FROM gangs ORDER BY turfs DESC, kills DESC')
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

-- Send leaderboard data when player loads
RegisterNetEvent('gangs:loadedPlayer', function()
    -- This is a relay event, not directly called here
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
        TriggerClientEvent('showNotification', killerId, 'Kill reward: $' .. reward, 'skull', '#00FF00')

        -- Update killer's kill count in their gang
        local killerState = Player(killerId).state
        local killerGang = killerState.gang
        if killerGang and killerGang ~= '' and killerGang ~= 'none' then
            MySQL.update.await('UPDATE gangs SET kills = kills + 1 WHERE name = ?', { killerGang })
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
