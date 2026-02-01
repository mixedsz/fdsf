-- Server-side utility functions and core initialization
Zen.Functions = Zen.Functions or {}
Zen.Players = {}
Zen.CachedPlayers = {}

-- Get ESX object
ESX = exports['es_extended']:getSharedObject()

-- Player count tracking
local playerCount = 0

-- Utility function to get player identifier
Zen.Functions.GetIdentifier = function(source, idType)
    idType = idType or 'license'
    local identifiers = GetPlayerIdentifiers(source)
    for _, id in pairs(identifiers) do
        if string.find(id, idType) then
            return id
        end
    end
    return nil
end

-- Utility function to get player data
Zen.Functions.GetPlayerData = function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end

    return {
        identifier = xPlayer.identifier,
        name = xPlayer.getName(),
        accounts = xPlayer.getAccounts(),
        inventory = xPlayer.getInventory(),
        loadout = xPlayer.getLoadout(),
        job = xPlayer.getJob(),
        coords = xPlayer.getCoords()
    }
end

-- Utility function to notify player
Zen.Functions.Notify = function(source, text, icon, color)
    TriggerClientEvent('showNotification', source, text, icon, color)
end

-- Utility function to notify all players
Zen.Functions.NotifyAll = function(text, icon, color)
    TriggerClientEvent('showNotification', -1, text, icon, color)
end

-- Utility function for logging
Zen.Functions.Log = function(title, message, color)
    if not Zen.Config.Server.Logging or not Zen.Config.Server.Logging.Enabled then return end

    local webhook = Zen.Config.Server.Logging.Webhook
    if webhook and webhook ~= '' then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
            embeds = {{
                title = title,
                description = message,
                color = color or 16711680,
                footer = { text = os.date('%Y-%m-%d %H:%M:%S') }
            }}
        }), { ['Content-Type'] = 'application/json' })
    end

    print(('[%s] %s: %s'):format(os.date('%H:%M:%S'), title, message))
end

-- Player loaded event handler
RegisterNetEvent('playerLoaded', function(serverId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then return end

    local identifier = Zen.Functions.GetIdentifier(source)

    -- Store player data
    Zen.Players[source] = {
        source = source,
        identifier = identifier,
        name = xPlayer.getName()
    }

    -- Update cached players
    Zen.CachedPlayers[identifier] = {
        id = source,
        identifier = identifier,
        name = xPlayer.getName(),
        lastSeen = os.time()
    }

    -- Update player count
    playerCount = playerCount + 1
    TriggerClientEvent('player:count', -1, playerCount)

    -- Set player state bags
    local ply = Player(source)
    ply.state:set('identifier', identifier, true)
    ply.state:set('name', xPlayer.getName(), true)
    ply.state:set('job', xPlayer.getJob(), true)

    Zen.Functions.Log('Player Joined', ('%s (ID: %s) has joined the server'):format(xPlayer.getName(), source), 65280)
end)

-- Player dropped handler
AddEventHandler('playerDropped', function(reason)
    local source = source

    if Zen.Players[source] then
        local identifier = Zen.Players[source].identifier

        -- Update cached players
        if Zen.CachedPlayers[identifier] then
            Zen.CachedPlayers[identifier].lastSeen = os.time()
            Zen.CachedPlayers[identifier].id = -1
        end

        Zen.Players[source] = nil
    end

    -- Update player count
    playerCount = math.max(0, playerCount - 1)
    TriggerClientEvent('player:count', -1, playerCount)
end)

-- Get online player count
Zen.Functions.GetPlayerCount = function()
    return playerCount
end

-- Check if player is online
Zen.Functions.IsPlayerOnline = function(identifier)
    for source, data in pairs(Zen.Players) do
        if data.identifier == identifier then
            return true, source
        end
    end
    return false, nil
end

-- Generate unique plate
Zen.Functions.GeneratePlate = function()
    local plate
    local isUnique = false

    while not isUnique do
        plate = ''
        for i = 1, 4 do
            plate = plate .. string.char(math.random(65, 90))
        end
        for i = 1, 4 do
            plate = plate .. tostring(math.random(0, 9))
        end

        local result = MySQL.scalar.await('SELECT plate FROM owned_vehicles WHERE plate = ?', { plate })
        if not result then
            isUnique = true
        end
    end

    return plate
end

-- Exports
exports('GetPlayerData', Zen.Functions.GetPlayerData)
exports('GetIdentifier', Zen.Functions.GetIdentifier)
exports('Notify', Zen.Functions.Notify)
exports('NotifyAll', Zen.Functions.NotifyAll)
exports('Log', Zen.Functions.Log)
exports('GetPlayerCount', Zen.Functions.GetPlayerCount)
exports('IsPlayerOnline', Zen.Functions.IsPlayerOnline)
exports('GeneratePlate', Zen.Functions.GeneratePlate)
