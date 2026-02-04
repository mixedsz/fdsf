-- Admin Menu Server-side Code

local cachedPlayers = {}

-- Admin callback for various actions
lib.callback.register('admin:server:callback', function(source, action, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end

    local group = xPlayer.getGroup()
    local adminGroups = Zen.Config.Server.Admin and Zen.Config.Server.Admin.Groups or {}

    if action == 'perms' then
        if adminGroups[group] then
            return adminGroups[group]
        end
        return nil

    elseif action == 'online' then
        local players = {}
        for _, playerId in pairs(GetPlayers()) do
            local xTarget = ESX.GetPlayerFromId(playerId)
            if xTarget then
                players[#players + 1] = {
                    id = tonumber(playerId),
                    name = xTarget.getName(),
                    identifier = xTarget.identifier,
                    staff = adminGroups[xTarget.getGroup()] ~= nil
                }
            end
        end
        return players

    elseif action == 'cached' then
        local players = {}
        for identifier, playerData in pairs(cachedPlayers) do
            if playerData.id == -1 then -- Only offline players
                players[#players + 1] = {
                    id = playerData.id,
                    name = playerData.name,
                    identifier = identifier,
                    staff = false
                }
            end
        end
        return players

    elseif action == 'coords' then
        if data and data.target then
            local xTarget = ESX.GetPlayerFromId(data.target)
            if xTarget then
                return xTarget.getCoords()
            end
        end
        return nil
    end

    return nil
end)

-- Track cached players
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    cachedPlayers[xPlayer.identifier] = {
        id = playerId,
        name = xPlayer.getName(),
        lastSeen = os.time()
    }
end)

AddEventHandler('playerDropped', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        cachedPlayers[xPlayer.identifier] = {
            id = -1,
            name = xPlayer.getName(),
            lastSeen = os.time()
        }
    end
end)

-- Admin commands
RegisterCommand('kick', function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
        if not perms or not perms.kick then return end
    end

    local targetId = tonumber(args[1])
    local reason = table.concat(args, ' ', 2) or 'No reason provided'

    if targetId then
        DropPlayer(targetId, 'Kicked: ' .. reason)
        Zen.Functions.Log('Admin Kick', ('%s kicked %s - %s'):format(
            source == 0 and 'Console' or GetPlayerName(source),
            GetPlayerName(targetId) or targetId,
            reason
        ), 16711680)
    end
end, false)

RegisterCommand('ban', function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
        if not perms or not perms.ban then return end
    end

    local targetId = tonumber(args[1])
    local reason = args[2] or 'No reason provided'
    local duration = tonumber(args[3]) or 0 -- 0 = permanent

    if targetId then
        local xTarget = ESX.GetPlayerFromId(targetId)
        if xTarget then
            local identifier = xTarget.identifier
            local expiry = duration > 0 and (os.time() + duration) or 0

            MySQL.insert.await('INSERT INTO bans (identifier, reason, expire, banner) VALUES (?, ?, ?, ?)', {
                identifier, reason, expiry, source == 0 and 'Console' or GetPlayerName(source)
            })

            DropPlayer(targetId, 'Banned: ' .. reason)

            Zen.Functions.Log('Admin Ban', ('%s banned %s for %s - %s'):format(
                source == 0 and 'Console' or GetPlayerName(source),
                xTarget.getName(),
                duration > 0 and (duration .. ' seconds') or 'permanently',
                reason
            ), 16711680)
        end
    end
end, false)

RegisterCommand('unban', function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
        if not perms or not perms.unban then return end
    end

    local identifier = args[1]

    if identifier then
        MySQL.query.await('DELETE FROM bans WHERE identifier LIKE ?', { '%' .. identifier .. '%' })

        if source ~= 0 then
            Zen.Functions.Notify(source, 'Player unbanned!', 'check', '#0EA5E9')
        end

        Zen.Functions.Log('Admin Unban', ('%s unbanned %s'):format(
            source == 0 and 'Console' or GetPlayerName(source),
            identifier
        ), 65280)
    end
end, false)

RegisterCommand('goto', function(source, args, rawCommand)
    if source == 0 then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
    if not perms or not perms.teleport then return end

    local targetId = tonumber(args[1])
    if targetId then
        local xTarget = ESX.GetPlayerFromId(targetId)
        if xTarget then
            local coords = xTarget.getCoords()
            xPlayer.setCoords(coords.x, coords.y, coords.z)
            Zen.Functions.Notify(source, 'Teleported to player!', 'location-dot', '#0EA5E9')
        end
    end
end, false)

RegisterCommand('bring', function(source, args, rawCommand)
    if source == 0 then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
    if not perms or not perms.teleport then return end

    local targetId = tonumber(args[1])
    if targetId then
        local xTarget = ESX.GetPlayerFromId(targetId)
        if xTarget then
            local coords = xPlayer.getCoords()
            xTarget.setCoords(coords.x, coords.y, coords.z)
            Zen.Functions.Notify(source, 'Brought player to you!', 'location-dot', '#0EA5E9')
            Zen.Functions.Notify(targetId, 'You were teleported by an admin!', 'location-dot', '#FFFF00')
        end
    end
end, false)

RegisterCommand('freeze', function(source, args, rawCommand)
    if source == 0 then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
    if not perms or not perms.freeze then return end

    local targetId = tonumber(args[1])
    local freeze = args[2] == 'true'

    if targetId then
        TriggerClientEvent('admin:freeze', targetId, freeze)
        Zen.Functions.Notify(source, freeze and 'Player frozen!' or 'Player unfrozen!', 'snowflake', '#0EA5E9')
    end
end, false)

RegisterCommand('revive', function(source, args, rawCommand)
    if source == 0 then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
    if not perms or not perms.revive then return end

    local targetId = tonumber(args[1]) or source

    TriggerClientEvent('deathscreen:revive', targetId)
    Zen.Functions.Notify(source, 'Player revived!', 'heart-pulse', '#0EA5E9')
end, false)

RegisterCommand('car', function(source, args, rawCommand)
    if source == 0 then return end

    local xPlayer = ESX.GetPlayerFromId(source)
    local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
    if not perms or not perms.spawnvehicle then return end

    local model = args[1]
    if model then
        lib.callback.await('admin:car', source, model)
    end
end, false)

RegisterCommand('entitywipe', function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
        if not perms or not perms.entitywipe then return end
    end

    local wipeType = tonumber(args[1]) or 1

    TriggerClientEvent('admin:entitywipe', -1, wipeType)

    if source ~= 0 then
        Zen.Functions.Notify(source, 'Entities wiped!', 'broom', '#0EA5E9')
    end
end, false)

RegisterCommand('offlineban', function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        local perms = Zen.Config.Server.Admin.Groups[xPlayer.getGroup()]
        if not perms or not perms.offlineban then return end
    end

    local identifier = args[1]
    local reason = args[2] or 'No reason provided'
    local duration = tonumber(args[3]) or 0

    if identifier then
        local expiry = duration > 0 and (os.time() + duration) or 0

        MySQL.insert.await('INSERT INTO bans (identifier, reason, expire, banner) VALUES (?, ?, ?, ?)', {
            identifier, reason, expiry, source == 0 and 'Console' or GetPlayerName(source)
        })

        if source ~= 0 then
            Zen.Functions.Notify(source, 'Player banned!', 'ban', '#0EA5E9')
        end

        Zen.Functions.Log('Admin Offline Ban', ('%s offline banned %s - %s'):format(
            source == 0 and 'Console' or GetPlayerName(source),
            identifier,
            reason
        ), 16711680)
    end
end, false)
