-- Server-side callback registrations
-- These callbacks are awaited by client scripts

-- Get player data callback (used by police, takehostage, etc.)
lib.callback.register('getPlayerData', function(source, targetId)
    local xPlayer = ESX.GetPlayerFromId(targetId)
    if not xPlayer then return nil end

    return {
        identifier = xPlayer.identifier,
        name = xPlayer.getName(),
        accounts = xPlayer.getAccounts(),
        inventory = xPlayer.getInventory(),
        loadout = xPlayer.getLoadout(),
        job = xPlayer.getJob()
    }
end)

-- Check if plate is already used
lib.callback.register('garage:plateUsed', function(source, plate)
    local result = MySQL.scalar.await('SELECT plate FROM owned_vehicles WHERE plate = ?', { plate })
    return result ~= nil
end)

-- Get player's vehicles from garage
lib.callback.register('garages:get', function(source, job, vehicleType)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {} end

    local query = 'SELECT * FROM owned_vehicles WHERE owner = ?'
    local params = { xPlayer.identifier }

    if job then
        query = 'SELECT * FROM owned_vehicles WHERE owner = ? AND job = ?'
        params = { xPlayer.identifier, job }
    end

    if vehicleType then
        query = query .. ' AND type = ?'
        table.insert(params, vehicleType)
    end

    local vehicles = MySQL.query.await(query, params)
    local result = {}

    for _, vehicle in pairs(vehicles or {}) do
        result[#result + 1] = {
            plate = vehicle.plate,
            label = vehicle.vehicle or 'Unknown',
            model = vehicle.model,
            type = vehicle.type or 'car'
        }
    end

    return result
end)

-- Get garage props for streaming
lib.callback.register('garages:props', function(source, plate)
    local result = MySQL.single.await('SELECT vehicle FROM owned_vehicles WHERE plate = ?', { plate })
    if result and result.vehicle then
        return json.decode(result.vehicle)
    end
    return nil
end)

-- Discord role check callback
lib.callback.register('discord:haveRole', function(source, roleId)
    -- If no Discord integration, return false
    if not Zen.Config.Server.Discord or Zen.Config.Server.Discord.BotToken == '' then
        return false
    end

    local discordId = Zen.Functions.GetIdentifier(source, 'discord')
    if not discordId then return false end

    discordId = discordId:gsub('discord:', '')

    -- Check if player has the role
    local hasRole = false
    local guildId = Zen.Config.Server.Discord.GuildId
    local botToken = Zen.Config.Server.Discord.BotToken

    if guildId ~= '' and botToken ~= '' then
        PerformHttpRequest(('https://discord.com/api/guilds/%s/members/%s'):format(guildId, discordId), function(errorCode, resultData, resultHeaders)
            if errorCode == 200 then
                local data = json.decode(resultData)
                if data and data.roles then
                    for _, role in pairs(data.roles) do
                        if tostring(role) == tostring(roleId) then
                            hasRole = true
                            break
                        end
                    end
                end
            end
        end, 'GET', '', { ['Authorization'] = 'Bot ' .. botToken })

        Wait(500) -- Wait for HTTP response
    end

    return hasRole
end)

-- Get all Discord roles for player
lib.callback.register('discord:roles', function(source)
    if not Zen.Config.Server.Discord or Zen.Config.Server.Discord.BotToken == '' then
        return {}
    end

    local discordId = Zen.Functions.GetIdentifier(source, 'discord')
    if not discordId then return {} end

    discordId = discordId:gsub('discord:', '')

    local roles = {}
    local guildId = Zen.Config.Server.Discord.GuildId
    local botToken = Zen.Config.Server.Discord.BotToken

    if guildId ~= '' and botToken ~= '' then
        local p = promise.new()

        PerformHttpRequest(('https://discord.com/api/guilds/%s/members/%s'):format(guildId, discordId), function(errorCode, resultData, resultHeaders)
            if errorCode == 200 then
                local data = json.decode(resultData)
                if data and data.roles then
                    roles = data.roles
                end
            end
            p:resolve(roles)
        end, 'GET', '', { ['Authorization'] = 'Bot ' .. botToken })

        return Citizen.Await(p)
    end

    return roles
end)

-- Donor check callback
lib.callback.register('donor:check', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check for donor item
    local donorItem = xPlayer.getInventoryItem('donor_car')
    if donorItem and donorItem.count > 0 then
        return true
    end

    -- Check Discord roles for donor status
    if Zen.Config.Server.Discord and Zen.Config.Server.Discord.Roles.Donor then
        for _, roleId in pairs(Zen.Config.Server.Discord.Roles.Donor) do
            if lib.callback.await('discord:haveRole', source, roleId) then
                return true
            end
        end
    end

    return false
end)

-- Key drop permission check
lib.callback.register('keydrop:hasKeyPermission', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check if player is admin
    if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then
        return true
    end

    -- Check Discord roles
    if Zen.Config.Server.Discord and Zen.Config.Server.Discord.Roles.KeyDrop then
        for _, roleId in pairs(Zen.Config.Server.Discord.Roles.KeyDrop) do
            local hasRole = lib.callback.await('discord:haveRole', source, roleId)
            if hasRole then return true end
        end
    end

    return false
end)

-- Coin drop permission check
lib.callback.register('keydrop:hasCoinPermission', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check if player is admin
    if xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin' then
        return true
    end

    -- Check Discord roles
    if Zen.Config.Server.Discord and Zen.Config.Server.Discord.Roles.CoinDrop then
        for _, roleId in pairs(Zen.Config.Server.Discord.Roles.CoinDrop) do
            local hasRole = lib.callback.await('discord:haveRole', source, roleId)
            if hasRole then return true end
        end
    end

    return false
end)

-- Steal outfit callback
lib.callback.register('stableDev:server:getPlayerOutfit', function(source, targetId)
    local xTarget = ESX.GetPlayerFromId(targetId)
    if not xTarget then return nil end

    -- Get the target player's current appearance/outfit
    local result = MySQL.single.await('SELECT skin FROM users WHERE identifier = ?', { xTarget.identifier })
    if result and result.skin then
        return json.decode(result.skin)
    end

    return nil
end)

-- Rich presence player count
lib.callback.register('richpresence:requestPlayerCount', function(source)
    return #GetPlayers()
end)

-- Illenium appearance outfits
lib.callback.register('illenium-appearance:server:getOutfits', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {} end

    local result = MySQL.query.await('SELECT * FROM player_outfits WHERE identifier = ?', { xPlayer.identifier })
    local outfits = {}

    for _, outfit in pairs(result or {}) do
        outfits[#outfits + 1] = {
            name = outfit.name,
            model = outfit.model,
            components = json.decode(outfit.components or '{}'),
            props = json.decode(outfit.props or '{}')
        }
    end

    return outfits
end)
