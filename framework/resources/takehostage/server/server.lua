-- Take Hostage Server-side Code

-- Sync hostage state
RegisterNetEvent('TakeHostage:sync', function(targetId)
    local source = source
    TriggerClientEvent('TakeHostage:sync', targetId, source)
end)

-- Release hostage
RegisterNetEvent('TakeHostage:release', function(targetId)
    local source = source
    TriggerClientEvent('TakeHostage:release', targetId)
end)

-- Kill hostage
RegisterNetEvent('TakeHostage:kill', function(targetId)
    local source = source
    TriggerClientEvent('TakeHostage:kill', targetId)
end)

-- Stop hostage situation
RegisterNetEvent('TakeHostage:stop', function(targetId)
    local source = source
    TriggerClientEvent('TakeHostage:stop', targetId)
end)

-- Search hostage
RegisterNetEvent('TakeHostage:search', function(targetId, itemType, itemName, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then return end

    if itemType == 'account' then
        local targetBalance = xTarget.getAccount(itemName).money
        if targetBalance >= amount then
            xTarget.removeAccountMoney(itemName, amount)
            xPlayer.addAccountMoney(itemName == 'black_money' and 'black_money' or 'money', amount)
            Zen.Functions.Notify(source, 'Robbed $' .. amount, 'dollar', '#0EA5E9')
            Zen.Functions.Notify(targetId, 'You were robbed of $' .. amount, 'dollar', '#EC4899')
        end
    elseif itemType == 'item' then
        local targetItem = xTarget.getInventoryItem(itemName)
        if targetItem and targetItem.count >= amount then
            if xPlayer.canCarryItem(itemName, amount) then
                xTarget.removeInventoryItem(itemName, amount)
                xPlayer.addInventoryItem(itemName, amount)
                Zen.Functions.Notify(source, 'Robbed ' .. amount .. 'x ' .. itemName, 'box', '#0EA5E9')
                Zen.Functions.Notify(targetId, 'You were robbed of ' .. amount .. 'x items', 'box', '#EC4899')
            else
                Zen.Functions.Notify(source, 'Inventory full!', 'box', '#EC4899')
            end
        end
    elseif itemType == 'weapon' then
        xTarget.removeWeapon(itemName)
        xPlayer.addWeapon(itemName, amount or 100)
        Zen.Functions.Notify(source, 'Robbed weapon', 'gun', '#0EA5E9')
        Zen.Functions.Notify(targetId, 'Your weapon was stolen', 'gun', '#EC4899')
    end
end)

-- Search nearby player for menu
RegisterNetEvent('th:searchNearbyPlayer', function()
    local source = source
    -- This triggers the client to open the search menu
    -- The actual search is done through the getPlayerData callback
end)
