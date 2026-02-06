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

    -- Check if player exists in database
    local exists = MySQL.single.await('SELECT identifier FROM users WHERE identifier = ?', { identifier })

    if exists then
        -- Update existing player
        MySQL.update.await('UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ? WHERE identifier = ?', {
            data.firstName,
            data.lastName,
            data.birthday,
            data.gender == 'male' and 'm' or 'f',
            identifier
        })
    else
        -- Insert new player with all required fields
        MySQL.insert.await([[
            INSERT INTO users (identifier, accounts, `group`, inventory, job, job_grade, loadout, metadata, position, firstname, lastname, dateofbirth, sex)
            VALUES (?, '{"bank": 5000, "money": 500, "black_money": 0}', 'user', '[]', 'unemployed', 0, '[]', '{}', '{"x": -269.4, "y": -955.3, "z": 31.2}', ?, ?, ?, ?)
        ]], {
            identifier,
            data.firstName,
            data.lastName,
            data.birthday,
            data.gender == 'male' and 'm' or 'f'
        })
    end

    -- Update player name state
    local ply = Player(source)
    if ply then
        ply.state:set('name', data.firstName .. ' ' .. data.lastName, true)
    end

    Zen.Functions.Notify(source, 'Registration complete! Reconnecting...', 'check', '#0EA5E9')

    -- Log registration
    print(('[Register] Player %s registered as %s %s'):format(identifier, data.firstName, data.lastName))

    -- Kick player to reconnect so ESX loads them properly
    SetTimeout(2000, function()
        DropPlayer(source, 'Registration complete! Please reconnect to start playing.')
    end)

    return true
end)

-- Check if player needs to register when they connect
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    deferrals.defer()
    Wait(0)

    deferrals.update('Checking registration status...')

    local identifier = GetPlayerIdentifier(source)
    if not identifier then
        deferrals.done('Could not verify your license. Please restart FiveM.')
        return
    end

    -- Check if player exists and has a name
    local result = MySQL.single.await('SELECT firstname, lastname FROM users WHERE identifier = ?', { identifier })

    Wait(100)
    deferrals.done()
end)

-- Check if player needs to register after loading
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    local result = MySQL.single.await('SELECT firstname, lastname FROM users WHERE identifier = ?', { xPlayer.identifier })

    if not result or not result.firstname or result.firstname == '' or result.firstname == nil then
        TriggerClientEvent('register:open', playerId)
    else
        -- Set player name state
        local ply = Player(playerId)
        if ply then
            ply.state:set('name', result.firstname .. ' ' .. result.lastname, true)
        end
    end
end)

-- Also trigger for players who don't exist in DB yet
RegisterNetEvent('esx:playerLoading', function()
    local source = source
    local identifier = GetPlayerIdentifier(source)

    if not identifier then return end

    local result = MySQL.single.await('SELECT firstname, lastname FROM users WHERE identifier = ?', { identifier })

    -- If player doesn't exist or has no name, open register
    if not result or not result.firstname or result.firstname == '' then
        SetTimeout(5000, function()
            TriggerClientEvent('register:open', source)
        end)
    end
end)
