-- Server-side event handlers
-- These events are triggered by client scripts

-- Gangs player loaded event
RegisterNetEvent('gangs:playerLoaded', function()
    local source = source
    local esx = GetESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Get player's gang from database
    local result = MySQL.single.await([[
        SELECT gm.*, g.name as gang_name, g.label as gang_label
        FROM gang_members gm
        LEFT JOIN gangs g ON gm.gang = g.name
        WHERE gm.identifier = ?
    ]], { xPlayer.identifier })

    if result then
        local ply = Player(source)
        ply.state:set('gang', result.gang_name, true)
        ply.state:set('gang_rank', result.rank, true)

        TriggerClientEvent('gangs:set', source, {
            label = result.gang_label,
            rank_label = result.rank_label or 'Member'
        })

        TriggerClientEvent('gangs:loadedPlayer', source)
    else
        local ply = Player(source)
        ply.state:set('gang', nil, true)
        ply.state:set('gang_rank', nil, true)

        TriggerClientEvent('gangs:set', source, nil)
        TriggerClientEvent('gangs:loadedPlayer', source)
    end
end)

-- Add weapon to inventory
RegisterNetEvent('addWeaponToInventory', function(weapon, ammo)
    local source = source
    local esx = GetESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    xPlayer.addWeapon(weapon, ammo or 100)
    Zen.Functions.Notify(source, 'Weapon added to inventory', 'gun', '#00FF00')
end)

-- Usable item remove
RegisterNetEvent('usable:remove', function(item, count)
    local source = source
    local esx = GetESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    count = count or 1
    xPlayer.removeInventoryItem(item, count)
end)

-- Shop purchase event
RegisterNetEvent('shop:purchase', function(item, amount, shopType)
    local source = source
    local esx = GetESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Get item price from KMenu config
    local price = 0
    if Zen.Config and Zen.Config.KMenu and Zen.Config.KMenu.Items then
        for _, v in pairs(Zen.Config.KMenu.Items) do
            if v.item == item then
                price = v.price * (amount or 1)
                break
            end
        end
    end

    -- Add item to player inventory
    if xPlayer.canCarryItem(item, amount) then
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            xPlayer.addInventoryItem(item, amount)
            Zen.Functions.Notify(source, 'Purchased ' .. amount .. 'x ' .. item, 'check', '#00FF00')
        else
            Zen.Functions.Notify(source, 'Not enough money!', 'dollar', '#FF0000')
        end
    else
        Zen.Functions.Notify(source, 'Inventory is full!', 'box', '#FF0000')
    end
end)

-- Gun store purchase event
RegisterNetEvent('gunstore:purchase', function(paymentType, weapon, shopType)
    local source = source
    local esx = GetESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Verify player job if required
    if shopType == 'police' and xPlayer.getJob().name ~= 'police' then
        return Zen.Functions.Notify(source, 'Access denied!', 'xmark', '#FF0000')
    end

    -- Get weapon price from KMenu config
    local price = 0
    if Zen.Config and Zen.Config.KMenu and Zen.Config.KMenu.Weapons then
        for _, v in pairs(Zen.Config.KMenu.Weapons) do
            if v.weapon == weapon then
                price = v.price
                break
            end
        end
    end

    if paymentType == 'money' then
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            xPlayer.addWeapon(weapon, 100)
            Zen.Functions.Notify(source, 'Weapon purchased!', 'gun', '#00FF00')
        else
            Zen.Functions.Notify(source, 'Not enough money! Need $' .. price, 'dollar', '#FF0000')
        end
    elseif paymentType == 'bank' then
        local bankAccount = xPlayer.getAccount('bank')
        if bankAccount and bankAccount.money >= price then
            xPlayer.removeAccountMoney('bank', price)
            xPlayer.addWeapon(weapon, 100)
            Zen.Functions.Notify(source, 'Weapon purchased!', 'gun', '#00FF00')
        else
            Zen.Functions.Notify(source, 'Not enough money in bank!', 'dollar', '#FF0000')
        end
    end
end)

-- ESX Society deposit money
RegisterNetEvent('esx_society:depositMoney', function(society, amount)
    local source = source
    local esx = GetESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    if amount <= 0 then return end

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)
        if account then
            account.addMoney(amount)
        end
    end)
end)

-- ESX Society check balance
RegisterNetEvent('esx_society:checkSocietyBalance', function(society, cb)
    local source = source

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)
        if account then
            if cb then cb(account.money) end
        else
            if cb then cb(0) end
        end
    end)
end)

-- ESX Society withdraw money
RegisterNetEvent('esx_society:withdrawMoney', function(society, amount)
    local source = source
    local esx = GetESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    if amount <= 0 then return end

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)
        if account and account.money >= amount then
            account.removeMoney(amount)
            xPlayer.addMoney(amount)
            Zen.Functions.Notify(source, 'Withdrew $' .. amount, 'dollar', '#00FF00')
        else
            Zen.Functions.Notify(source, 'Not enough funds in society!', 'dollar', '#FF0000')
        end
    end)
end)

-- ESX Society wash money
RegisterNetEvent('esx_society:washMoney', function(society, amount)
    local source = source
    local esx = GetESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    if amount <= 0 then return end

    local dirtyAccount = xPlayer.getAccount('black_money')
    local dirtyMoney = dirtyAccount and dirtyAccount.money or 0
    if dirtyMoney >= amount then
        xPlayer.removeAccountMoney('black_money', amount)

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)
            if account then
                account.addMoney(amount)
                Zen.Functions.Notify(source, 'Washed $' .. amount, 'dollar', '#00FF00')
            end
        end)
    else
        Zen.Functions.Notify(source, 'Not enough dirty money!', 'dollar', '#FF0000')
    end
end)

-- Emote sync events
RegisterNetEvent('scully_emotemenu:removeProps', function()
    local source = source
    TriggerClientEvent('scully_emotemenu:removeProps', -1, source)
end)

RegisterNetEvent('scully_emotemenu:requestSynchronizedEmote', function(targetId, emote)
    local source = source
    TriggerClientEvent('scully_emotemenu:synchronizedEmoteRequest', targetId, source, emote)
end)

RegisterNetEvent('scully_emotemenu:syncPtfx', function(asset, name, offset, rot, scale, duration)
    local source = source
    TriggerClientEvent('scully_emotemenu:syncPtfx', -1, source, asset, name, offset, rot, scale, duration)
end)

RegisterNetEvent('scully_emotemenu:cancelSynchronizedEmote', function(targetId)
    local source = source
    TriggerClientEvent('scully_emotemenu:cancelSynchronizedEmote', targetId, source)
end)

RegisterNetEvent('scully_emotemenu:createProp', function(prop, bone, offset, rot)
    local source = source
    TriggerClientEvent('scully_emotemenu:createProp', -1, source, prop, bone, offset, rot)
end)

RegisterNetEvent('scully_emotemenu:requestAttach', function(targetId, bone, offset, rot)
    local source = source
    TriggerClientEvent('scully_emotemenu:attachRequest', targetId, source, bone, offset, rot)
end)

RegisterNetEvent('scully_emotemenu:syncProp', function(prop, bone, offset, rot)
    local source = source
    TriggerClientEvent('scully_emotemenu:syncProp', -1, source, prop, bone, offset, rot)
end)

RegisterNetEvent('scully_emotemenu:synchronizedEmoteResponse', function(targetId, accepted, emote)
    local source = source
    TriggerClientEvent('scully_emotemenu:synchronizedEmoteResponse', targetId, source, accepted, emote)
end)

RegisterNetEvent('scully_emotemenu:setPropWhitelist', function(props)
    local source = source
    -- Handle prop whitelist
end)

-- Piggyback events
RegisterNetEvent('piggyback:stop', function(targetId)
    local source = source
    TriggerClientEvent('piggyback:stop', targetId, source)
    TriggerClientEvent('piggyback:stop', source, targetId)
end)

RegisterNetEvent('piggyback:sync', function(targetId)
    local source = source
    TriggerClientEvent('piggyback:sync', targetId, source)
end)

-- Rich presence update
RegisterNetEvent('richpresence:requestPlayerCount', function()
    local source = source
    TriggerClientEvent('richpresence:updatePlayerCount', source, #GetPlayers())
end)
