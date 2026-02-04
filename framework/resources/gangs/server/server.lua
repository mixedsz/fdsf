-- Gangs Server-side Code
local Turf = Zen.Config.Gang.Turfs
local gangs = Zen.Config.Gang.Gangs or {}
local turfs = Turf.Zones or {}

local turfTimers = {}
local turfKills = {}
local turfParticipants = {}
local turfStrikes = {}

-- Get gang members callback
lib.callback.register('gangs:get:members', function(source, gangName)
    local members = {}

    local result = MySQL.query.await([[
        SELECT gm.*, u.firstname, u.lastname
        FROM gang_members gm
        LEFT JOIN users u ON gm.identifier = u.identifier
        WHERE gm.gang = ?
    ]], { gangName })

    for _, member in pairs(result or {}) do
        members[#members + 1] = {
            identifier = member.identifier,
            name = (member.firstname or 'Unknown') .. ' ' .. (member.lastname or ''),
            rank = member.rank,
            leader = member.rank >= 3
        }
    end

    return members
end)

-- Get gang storage data callback
lib.callback.register('gangs:storage:getData', function(source, gangName)
    local result = MySQL.single.await('SELECT * FROM gang_storages WHERE gang = ?', { gangName })

    if result then
        return {
            accounts = json.decode(result.accounts or '{}'),
            items = json.decode(result.items or '{}')
        }
    end

    -- Create new storage if doesn't exist
    MySQL.insert.await('INSERT INTO gang_storages (gang, accounts, items) VALUES (?, ?, ?)', {
        gangName,
        json.encode({ money = 0, black_money = 0 }),
        json.encode({})
    })

    return {
        accounts = { money = 0, black_money = 0 },
        items = {}
    }
end)

-- Change gang member grade
RegisterNetEvent('gangs:changeGrade', function(newGrade, targetIdentifier, targetName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local playerGang = Player(source).state.gang
    local playerRank = Player(source).state.gang_rank

    if not playerGang then return end

    -- Verify player has permission (leader)
    local gangData = gangs[playerGang]
    if not gangData or not gangData.ranks[playerRank] or not gangData.ranks[playerRank].leader then
        return Zen.Functions.Notify(source, 'You don\'t have permission!', 'xmark', '#EC4899')
    end

    -- Update member grade
    MySQL.update.await('UPDATE gang_members SET rank = ? WHERE identifier = ? AND gang = ?', {
        newGrade, targetIdentifier, playerGang
    })

    -- Notify target if online
    local isOnline, targetSource = Zen.Functions.IsPlayerOnline(targetIdentifier)
    if isOnline then
        local ply = Player(targetSource)
        ply.state:set('gang_rank', newGrade, true)

        TriggerClientEvent('gangs:set', targetSource, {
            label = gangData.name,
            rank_label = gangData.ranks[newGrade] and gangData.ranks[newGrade].label or 'Member'
        })

        Zen.Functions.Notify(targetSource, 'Your rank has been changed!', 'ranking-star', '#0EA5E9')
    end

    Zen.Functions.Notify(source, 'Changed ' .. targetName .. '\'s rank!', 'check', '#0EA5E9')
end)

-- Kick gang member
RegisterNetEvent('gangs:kick', function(targetIdentifier, targetName)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local playerGang = Player(source).state.gang
    local playerRank = Player(source).state.gang_rank

    if not playerGang then return end

    -- Verify player has permission (leader)
    local gangData = gangs[playerGang]
    if not gangData or not gangData.ranks[playerRank] or not gangData.ranks[playerRank].leader then
        return Zen.Functions.Notify(source, 'You don\'t have permission!', 'xmark', '#EC4899')
    end

    -- Remove member from gang
    MySQL.query.await('DELETE FROM gang_members WHERE identifier = ? AND gang = ?', {
        targetIdentifier, playerGang
    })

    -- Notify target if online
    local isOnline, targetSource = Zen.Functions.IsPlayerOnline(targetIdentifier)
    if isOnline then
        local ply = Player(targetSource)
        ply.state:set('gang', nil, true)
        ply.state:set('gang_rank', nil, true)

        TriggerClientEvent('gangs:set', targetSource, nil)
        Zen.Functions.Notify(targetSource, 'You have been kicked from the gang!', 'xmark', '#EC4899')
    end

    Zen.Functions.Notify(source, 'Kicked ' .. targetName .. ' from the gang!', 'check', '#0EA5E9')
end)

-- Add new gang member
RegisterNetEvent('gangs:addNewMember', function(targetId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then
        return Zen.Functions.Notify(source, 'Player not found!', 'xmark', '#EC4899')
    end

    local playerGang = Player(source).state.gang
    local playerRank = Player(source).state.gang_rank

    if not playerGang then return end

    -- Verify player has permission (leader)
    local gangData = gangs[playerGang]
    if not gangData or not gangData.ranks[playerRank] or not gangData.ranks[playerRank].leader then
        return Zen.Functions.Notify(source, 'You don\'t have permission!', 'xmark', '#EC4899')
    end

    -- Check if target is already in a gang
    local targetGang = Player(targetId).state.gang
    if targetGang then
        return Zen.Functions.Notify(source, 'Player is already in a gang!', 'xmark', '#EC4899')
    end

    -- Add member to gang
    MySQL.insert.await('INSERT INTO gang_members (identifier, gang, rank, rank_label) VALUES (?, ?, ?, ?)', {
        xTarget.identifier, playerGang, 1, gangData.ranks[1] and gangData.ranks[1].label or 'Member'
    })

    -- Update target state
    local ply = Player(targetId)
    ply.state:set('gang', playerGang, true)
    ply.state:set('gang_rank', 1, true)

    TriggerClientEvent('gangs:set', targetId, {
        label = gangData.name,
        rank_label = gangData.ranks[1] and gangData.ranks[1].label or 'Member'
    })

    TriggerClientEvent('gangs:loadedPlayer', targetId)

    Zen.Functions.Notify(source, 'Added player to the gang!', 'check', '#0EA5E9')
    Zen.Functions.Notify(targetId, 'You have been added to ' .. gangData.name .. '!', 'users', '#0EA5E9')
end)

-- Gang kills tracking
RegisterNetEvent('gangs:killed', function(victimId, attackerId)
    local source = source

    local attackerGang = Player(attackerId).state.gang
    local victimGang = Player(victimId).state.gang

    if not attackerGang or attackerGang == victimGang then return end

    -- Log the kill
    Zen.Functions.Log('Gang Kill', ('%s (Gang: %s) killed %s (Gang: %s)'):format(
        GetPlayerName(attackerId), attackerGang or 'None',
        GetPlayerName(victimId), victimGang or 'None'
    ), 16711680)
end)

-- Storage withdraw
RegisterNetEvent('gangs:storages:withdraw', function(gangName, data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local playerGang = Player(source).state.gang
    if playerGang ~= gangName then return end

    local storage = MySQL.single.await('SELECT * FROM gang_storages WHERE gang = ?', { gangName })
    if not storage then return end

    local accounts = json.decode(storage.accounts or '{}')
    local items = json.decode(storage.items or '{}')

    if data.type == 'account' then
        local accountBalance = accounts[data.item] or 0
        if accountBalance < data.withdrawed then
            return Zen.Functions.Notify(source, 'Not enough funds!', 'dollar', '#EC4899')
        end

        accounts[data.item] = accountBalance - data.withdrawed
        xPlayer.addAccountMoney(data.item, data.withdrawed)

        Zen.Functions.Notify(source, 'Withdrew $' .. data.withdrawed, 'dollar', '#0EA5E9')
    elseif data.type == 'item' then
        local itemCount = items[data.item] or 0
        if itemCount < data.withdrawed then
            return Zen.Functions.Notify(source, 'Not enough items!', 'box', '#EC4899')
        end

        if not xPlayer.canCarryItem(data.item, data.withdrawed) then
            return Zen.Functions.Notify(source, 'Inventory full!', 'box', '#EC4899')
        end

        items[data.item] = itemCount - data.withdrawed
        if items[data.item] <= 0 then items[data.item] = nil end
        xPlayer.addInventoryItem(data.item, data.withdrawed)

        Zen.Functions.Notify(source, 'Took ' .. data.withdrawed .. 'x items', 'box', '#0EA5E9')
    end

    MySQL.update.await('UPDATE gang_storages SET accounts = ?, items = ? WHERE gang = ?', {
        json.encode(accounts), json.encode(items), gangName
    })
end)

-- Storage deposit
RegisterNetEvent('gangs:storages:deposit', function(gangName, data)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local playerGang = Player(source).state.gang
    if playerGang ~= gangName then return end

    local storage = MySQL.single.await('SELECT * FROM gang_storages WHERE gang = ?', { gangName })
    if not storage then return end

    local accounts = json.decode(storage.accounts or '{}')
    local items = json.decode(storage.items or '{}')

    if data.type == 'account' then
        local playerBalance = xPlayer.getAccount(data.item).money
        if playerBalance < data.deposited then
            return Zen.Functions.Notify(source, 'Not enough funds!', 'dollar', '#EC4899')
        end

        accounts[data.item] = (accounts[data.item] or 0) + data.deposited
        xPlayer.removeAccountMoney(data.item, data.deposited)

        Zen.Functions.Notify(source, 'Deposited $' .. data.deposited, 'dollar', '#0EA5E9')
    elseif data.type == 'item' then
        local playerItem = xPlayer.getInventoryItem(data.item)
        if not playerItem or playerItem.count < data.deposited then
            return Zen.Functions.Notify(source, 'Not enough items!', 'box', '#EC4899')
        end

        items[data.item] = (items[data.item] or 0) + data.deposited
        xPlayer.removeInventoryItem(data.item, data.deposited)

        Zen.Functions.Notify(source, 'Deposited ' .. data.deposited .. 'x items', 'box', '#0EA5E9')
    end

    MySQL.update.await('UPDATE gang_storages SET accounts = ?, items = ? WHERE gang = ?', {
        json.encode(accounts), json.encode(items), gangName
    })
end)

-- Turf start
RegisterNetEvent('turfs:start', function(turfId)
    local source = source
    local playerGang = Player(source).state.gang

    if not playerGang then
        return Zen.Functions.Notify(source, 'You must be in a gang!', 'xmark', '#EC4899')
    end

    local turfData = turfs[turfId]
    if not turfData then return end

    if turfData.initiated or turfData.started then
        return Zen.Functions.Notify(source, 'This turf is already active!', 'xmark', '#EC4899')
    end

    -- Mark turf as initiated
    turfs[turfId].initiated = true
    TriggerClientEvent('turfs:change', -1, turfs)

    -- Start countdown
    SetTimeout(Turf.Timers['Starting'] * 1000, function()
        turfs[turfId].initiated = false
        turfs[turfId].started = true
        turfTimers[turfId] = Turf.Timers['Duration']
        turfKills[turfId] = {}
        turfParticipants[turfId] = {}
        turfStrikes[turfId] = {}

        TriggerClientEvent('turfs:change', -1, turfs)
        TriggerClientEvent('turfs:started', -1, turfId)

        Zen.Functions.NotifyAll('Turf war has started at ' .. turfData.name .. '!', 'skull-crossbones', '#EC4899')
    end)

    Zen.Functions.Notify(source, 'Starting turf war...', 'skull-crossbones', '#EC4899')
end)

-- Turf action (enter/exit)
RegisterNetEvent('turfs:action', function(action, turfId)
    local source = source
    local playerGang = Player(source).state.gang

    if not playerGang then return end

    local turfData = turfs[turfId]
    if not turfData then return end

    if action == 'enter' then
        turfParticipants[turfId] = turfParticipants[turfId] or {}
        turfParticipants[turfId][source] = playerGang

        -- Give weapons if configured
        if Turf.Weapons and Turf.Weapons.OnEnter then
            for _, weapon in pairs(Turf.Weapons.OnEnter) do
                TriggerClientEvent('redzones:give:weapon', source, 'enter', weapon)
            end
        end
    elseif action == 'exit' then
        if turfParticipants[turfId] then
            turfParticipants[turfId][source] = nil
        end

        -- Remove weapons if configured
        if Turf.Weapons and Turf.Weapons.OnEnter then
            for _, weapon in pairs(Turf.Weapons.OnEnter) do
                TriggerClientEvent('redzones:give:weapon', source, 'exit', weapon)
            end
        end
    end
end)

-- Turf timer update thread
CreateThread(function()
    while true do
        Wait(1000)

        for turfId, timer in pairs(turfTimers) do
            if timer > 0 then
                turfTimers[turfId] = timer - 1
            else
                -- End turf war
                turfs[turfId].started = false
                turfs[turfId].captured = true

                -- Determine winner
                local gangKills = {}
                for gangName, kills in pairs(turfKills[turfId] or {}) do
                    gangKills[gangName] = (gangKills[gangName] or 0) + kills
                end

                local winner = nil
                local maxKills = 0
                for gangName, kills in pairs(gangKills) do
                    if kills > maxKills then
                        winner = gangName
                        maxKills = kills
                    end
                end

                if winner then
                    Zen.Functions.NotifyAll(winner .. ' has captured ' .. turfs[turfId].name .. '!', 'trophy', '#FFD700')
                end

                TriggerClientEvent('turfs:change', -1, turfs)
                TriggerClientEvent('turfs:end', -1, turfId)

                -- Reset after cooldown
                SetTimeout(Turf.Timers['Cooldown'] * 1000, function()
                    turfs[turfId].captured = false
                    TriggerClientEvent('turfs:change', -1, turfs)
                end)

                turfTimers[turfId] = nil
                turfKills[turfId] = nil
                turfParticipants[turfId] = nil
                turfStrikes[turfId] = nil
            end
        end

        -- Broadcast timer updates
        TriggerClientEvent('turfs:update', -1, turfTimers)
    end
end)

-- Set gang command
RegisterCommand('setgang', function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer or (xPlayer.getGroup() ~= 'admin' and xPlayer.getGroup() ~= 'superadmin') then
            return
        end
    end

    local targetId = tonumber(args[1])
    local gangName = args[2]
    local gangRank = tonumber(args[3]) or 1

    if not targetId or not gangName then
        return print('Usage: /setgang [playerId] [gangName] [rank]')
    end

    local xTarget = ESX.GetPlayerFromId(targetId)
    if not xTarget then
        return Zen.Functions.Notify(source, 'Player not found!', 'xmark', '#EC4899')
    end

    -- Remove from old gang
    MySQL.query.await('DELETE FROM gang_members WHERE identifier = ?', { xTarget.identifier })

    if gangName ~= 'none' and gangs[gangName] then
        -- Add to new gang
        MySQL.insert.await('INSERT INTO gang_members (identifier, gang, rank, rank_label) VALUES (?, ?, ?, ?)', {
            xTarget.identifier, gangName, gangRank,
            gangs[gangName].ranks[gangRank] and gangs[gangName].ranks[gangRank].label or 'Member'
        })

        local ply = Player(targetId)
        ply.state:set('gang', gangName, true)
        ply.state:set('gang_rank', gangRank, true)

        TriggerClientEvent('gangs:set', targetId, {
            label = gangs[gangName].name,
            rank_label = gangs[gangName].ranks[gangRank] and gangs[gangName].ranks[gangRank].label or 'Member'
        })
    else
        local ply = Player(targetId)
        ply.state:set('gang', nil, true)
        ply.state:set('gang_rank', nil, true)

        TriggerClientEvent('gangs:set', targetId, nil)
    end

    TriggerClientEvent('gangs:loadedPlayer', targetId)

    if source ~= 0 then
        Zen.Functions.Notify(source, 'Updated player gang!', 'check', '#0EA5E9')
    end
end, false)
