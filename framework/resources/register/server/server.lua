-- Register Server-side Code

-- Get player identifier
local function GetPlayerIdentifier(source)
    for _, id in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(id, 'license:') then
            return id
        end
    end
    return nil
end

-- Create player in database if they don't exist (runs before ESX loads them)
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local identifier = GetPlayerIdentifier(source)

    if not identifier then return end

    -- Check if player exists
    local exists = MySQL.single.await('SELECT identifier FROM users WHERE identifier = ?', { identifier })

    if not exists then
        -- Create new player with default values so ESX can load them
        print('[Register] Creating new player in database: ' .. identifier)
        MySQL.insert.await([[
            INSERT INTO users (identifier, accounts, `group`, inventory, job, job_grade, loadout, metadata, position)
            VALUES (?, '{"bank": 5000, "money": 500, "black_money": 0}', 'user', '[]', 'unemployed', 0, '[]', '{}', '{"x": -269.4, "y": -955.3, "z": 31.2}')
        ]], { identifier })
    end
end)

-- Callback to check if player needs to register
lib.callback.register('register:isNewPlayer', function(source)
    local identifier = GetPlayerIdentifier(source)
    if not identifier then return false end

    local result = MySQL.single.await('SELECT firstname FROM users WHERE identifier = ?', { identifier })

    -- Player needs to register if no firstname
    if not result or not result.firstname or result.firstname == '' then
        return true
    end
    return false
end)

-- Register callback to save player data
lib.callback.register('fatal:registerPlayer', function(source, data)
    local identifier = GetPlayerIdentifier(source)
    if not identifier then
        print('[Register] Failed to get identifier for player ' .. source)
        return false
    end

    if not data.firstName or not data.lastName or not data.birthday or not data.gender then
        return false
    end

    -- Check for blacklisted words
    local fullName = (data.firstName .. ' ' .. data.lastName):lower()
    for _, word in pairs(Zen.Config.Server.BlacklistedWords or {}) do
        if string.find(fullName, word:lower()) then
            Zen.Functions.Notify(source, 'Invalid name!', 'xmark', '#EC4899')
            return false
        end
    end

    -- Update player with their name
    MySQL.update.await('UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ? WHERE identifier = ?', {
        data.firstName,
        data.lastName,
        data.birthday,
        data.gender == 'male' and 'm' or 'f',
        identifier
    })

    -- Update player name state
    local ply = Player(source)
    if ply then
        ply.state:set('name', data.firstName .. ' ' .. data.lastName, true)
    end

    Zen.Functions.Notify(source, 'Character created successfully!', 'check', '#0EA5E9')
    print(('[Register] Player %s registered as %s %s'):format(identifier, data.firstName, data.lastName))

    return true
end)

-- Check if player needs to register after ESX loads them
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    -- Check immediately if player needs to register
    local result = MySQL.single.await('SELECT firstname FROM users WHERE identifier = ?', { xPlayer.identifier })

    if not result or not result.firstname or result.firstname == '' then
        -- Trigger register immediately
        TriggerClientEvent('register:open', playerId)
    else
        -- Set player name state
        local ply = Player(playerId)
        if ply then
            ply.state:set('name', result.firstname .. ' ' .. (result.lastname or ''), true)
        end
    end
end)
