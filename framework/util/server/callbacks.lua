-- Server-side callback registrations
-- These callbacks are awaited by client scripts

-- Get player data callback (used by police, takehostage, etc.)
lib.callback.register('getPlayerData', function(source, targetId)
    local esx = GetESX()
    if not esx then return nil end
    local xPlayer = esx.GetPlayerFromId(targetId)
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
    local esx = GetESX()
    if not esx then return {} end
    local xPlayer = esx.GetPlayerFromId(source)
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
    if not Zen.Config or not Zen.Config.Server or not Zen.Config.Server.Discord or Zen.Config.Server.Discord.BotToken == '' then
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
    if not Zen.Config or not Zen.Config.Server or not Zen.Config.Server.Discord or Zen.Config.Server.Discord.BotToken == '' then
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
    local esx = GetESX()
    if not esx then return false end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check for donor item
    local donorItem = xPlayer.getInventoryItem('donor_car')
    if donorItem and donorItem.count > 0 then
        return true
    end

    -- Check Discord roles for donor status
    if Zen.Config and Zen.Config.Server and Zen.Config.Server.Discord and Zen.Config.Server.Discord.Roles and Zen.Config.Server.Discord.Roles.Donor then
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
    local esx = GetESX()
    if not esx then
        print('[Zen] keydrop:hasKeyPermission - ESX not ready')
        return false
    end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then
        print('[Zen] keydrop:hasKeyPermission - Player not found: ' .. tostring(source))
        return false
    end

    -- Check if player is admin
    local group = xPlayer.getGroup()
    if group == 'admin' or group == 'superadmin' then
        return true
    end

    -- Check Discord roles
    if Zen.Config and Zen.Config.Server and Zen.Config.Server.Discord and Zen.Config.Server.Discord.Roles and Zen.Config.Server.Discord.Roles.KeyDrop then
        for _, roleId in pairs(Zen.Config.Server.Discord.Roles.KeyDrop) do
            local hasRole = lib.callback.await('discord:haveRole', source, roleId)
            if hasRole then return true end
        end
    end

    return false
end)

-- Coin drop permission check
lib.callback.register('keydrop:hasCoinPermission', function(source)
    local esx = GetESX()
    if not esx then return false end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check if player is admin
    local group = xPlayer.getGroup()
    if group == 'admin' or group == 'superadmin' then
        return true
    end

    -- Check Discord roles
    if Zen.Config and Zen.Config.Server and Zen.Config.Server.Discord and Zen.Config.Server.Discord.Roles and Zen.Config.Server.Discord.Roles.CoinDrop then
        for _, roleId in pairs(Zen.Config.Server.Discord.Roles.CoinDrop) do
            local hasRole = lib.callback.await('discord:haveRole', source, roleId)
            if hasRole then return true end
        end
    end

    return false
end)

-- Steal outfit callback
lib.callback.register('stableDev:server:getPlayerOutfit', function(source, targetId)
    local esx = GetESX()
    if not esx then return nil end
    local xTarget = esx.GetPlayerFromId(targetId)
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
    local esx = GetESX()
    if not esx then return {} end
    local xPlayer = esx.GetPlayerFromId(source)
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

-- Register player callback (for new players)
lib.callback.register('fatal:registerPlayer', function(source, data)
    local esx = GetESX()
    if not esx then return false end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Validate data
    if not data.firstName or not data.lastName or not data.birthday or not data.gender then
        Zen.Functions.Notify(source, 'Please fill out all fields!', 'xmark', '#FF0000')
        return false
    end

    -- Check for blacklisted words
    local blacklistedWords = (Zen.Config and Zen.Config.Server and Zen.Config.Server.BlacklistedWords) or {}
    local fullName = string.lower(data.firstName .. ' ' .. data.lastName)

    for _, word in pairs(blacklistedWords) do
        if string.find(fullName, string.lower(word)) then
            Zen.Functions.Notify(source, 'Name contains blacklisted word!', 'xmark', '#FF0000')
            return false
        end
    end

    -- Update database
    local success = MySQL.update.await([[
        UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ?
        WHERE identifier = ?
    ]], { data.firstName, data.lastName, data.birthday, data.gender, xPlayer.identifier })

    if success then
        -- Update player state
        local ply = Player(source)
        ply.state:set('name', data.firstName .. ' ' .. data.lastName, true)

        Zen.Functions.Notify(source, 'Registration successful!', 'check', '#00FF00')
        Zen.Functions.Log('Player Registered', ('%s registered as %s %s'):format(xPlayer.identifier, data.firstName, data.lastName), 65280)
        return true
    end

    Zen.Functions.Notify(source, 'Registration failed!', 'xmark', '#FF0000')
    return false
end)

-- Deathscreen balance check
lib.callback.register('deathscreen:checkBalance', function(source, price)
    local esx = GetESX()
    if not esx then return false end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return false end

    local bankAccount = xPlayer.getAccount('bank')
    if not bankAccount then return false end

    local bankBalance = bankAccount.money or 0
    return bankBalance >= (price or 0)
end)

-- Vehicle shop buy callback
lib.callback.register('vehicleshop:buy', function(source, props, vehicleType, price, isDonor, label)
    local esx = GetESX()
    if not esx then return false end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check if player has enough money
    local bankAccount = xPlayer.getAccount('bank')
    if not bankAccount then return false end

    local bankBalance = bankAccount.money or 0
    if bankBalance < price then
        Zen.Functions.Notify(source, 'Not enough money in bank!', 'dollar', '#FF0000')
        return false
    end

    -- Deduct money
    xPlayer.removeAccountMoney('bank', price)

    -- Insert vehicle into database
    MySQL.insert.await([[
        INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored)
        VALUES (?, ?, ?, ?, 1)
    ]], { xPlayer.identifier, props.plate, json.encode(props), vehicleType or 'car' })

    Zen.Functions.Notify(source, 'Vehicle purchased successfully!', 'car', '#00FF00')
    Zen.Functions.Log('Vehicle Purchase', ('%s purchased %s for $%s'):format(xPlayer.getName(), label or 'vehicle', price), 65280)

    return true
end)

-- Check if player is new (for registration)
lib.callback.register('register:isNewPlayer', function(source)
    local esx = GetESX()
    if not esx then return false end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check database for firstname
    local result = MySQL.single.await('SELECT firstname FROM users WHERE identifier = ?', { xPlayer.identifier })

    if result then
        local firstName = result.firstname
        if not firstName or firstName == '' or firstName == 'Unknown' or firstName == nil then
            print('[Zen] Player ' .. source .. ' is new - showing registration')
            return true
        end
    end

    return false
end)

-- Admin server callback
lib.callback.register('admin:server:callback', function(source, action, data)
    local esx = GetESX()
    if not esx then return false end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check admin permission
    local group = xPlayer.getGroup()
    if group ~= 'admin' and group ~= 'superadmin' then
        return false
    end

    if action == 'getPlayers' then
        local players = {}
        for _, playerId in pairs(GetPlayers()) do
            local target = esx.GetPlayerFromId(tonumber(playerId))
            if target then
                players[#players + 1] = {
                    id = tonumber(playerId),
                    name = target.getName(),
                    job = target.getJob().label
                }
            end
        end
        return players

    elseif action == 'kick' then
        if data.target then
            DropPlayer(data.target, data.reason or 'Kicked by admin')
            Zen.Functions.Log('Admin Kick', ('%s kicked player %s'):format(xPlayer.getName(), data.target), 16711680)
            return true
        end

    elseif action == 'ban' then
        if data.target then
            local targetPlayer = esx.GetPlayerFromId(data.target)
            if targetPlayer then
                local identifier = targetPlayer.identifier
                MySQL.insert.await('INSERT INTO bans (identifier, reason, expire, banner) VALUES (?, ?, ?, ?)', {
                    identifier, data.reason or 'Banned', data.duration or 0, xPlayer.identifier
                })
                DropPlayer(data.target, 'Banned: ' .. (data.reason or 'No reason given'))
                Zen.Functions.Log('Admin Ban', ('%s banned %s'):format(xPlayer.getName(), targetPlayer.getName()), 16711680)
                return true
            end
        end

    elseif action == 'revive' then
        if data.target then
            TriggerClientEvent('deathscreen:revive', data.target)
            Zen.Functions.Log('Admin Revive', ('%s revived player %s'):format(xPlayer.getName(), data.target), 65280)
            return true
        end

    elseif action == 'teleport' then
        if data.target and data.coords then
            TriggerClientEvent('admin:teleport', data.target, data.coords)
            return true
        end

    elseif action == 'giveMoney' then
        if data.target and data.amount then
            local target = esx.GetPlayerFromId(data.target)
            if target then
                target.addMoney(data.amount)
                Zen.Functions.Log('Admin Give Money', ('%s gave $%s to %s'):format(xPlayer.getName(), data.amount, target.getName()), 65280)
                return true
            end
        end

    elseif action == 'giveItem' then
        if data.target and data.item and data.amount then
            local target = esx.GetPlayerFromId(data.target)
            if target then
                target.addInventoryItem(data.item, data.amount)
                Zen.Functions.Log('Admin Give Item', ('%s gave %sx %s to %s'):format(xPlayer.getName(), data.amount, data.item, target.getName()), 65280)
                return true
            end
        end
    end

    return false
end)
