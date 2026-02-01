-- K Menu Server-side Code
-- K menu purchases and shop handling

-- Shop purchase (same as general shop)
RegisterNetEvent('shop:purchase', function(item, amount, shopType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Get item info from Zen.Items
    local itemInfo = Zen.Items and Zen.Items[item]
    if not itemInfo then
        return Zen.Functions.Notify(source, 'Invalid item!', 'xmark', '#FF0000')
    end

    local price = itemInfo.price or 0

    if not xPlayer.canCarryItem(item, amount) then
        return Zen.Functions.Notify(source, 'Inventory full!', 'box', '#FF0000')
    end

    local totalPrice = price * amount

    if xPlayer.getMoney() >= totalPrice then
        xPlayer.removeMoney(totalPrice)
        xPlayer.addInventoryItem(item, amount)
        Zen.Functions.Notify(source, 'Purchased ' .. amount .. 'x ' .. (itemInfo.label or item), 'check', '#00FF00')
    else
        Zen.Functions.Notify(source, 'Not enough money!', 'dollar', '#FF0000')
    end
end)

-- Gun store purchase (same as police but for general stores)
RegisterNetEvent('gunstore:purchase', function(paymentType, weapon, shopType)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Get weapon info
    local weaponInfo = Zen.Weapons and Zen.Weapons[weapon]
    if not weaponInfo then
        return Zen.Functions.Notify(source, 'Invalid weapon!', 'xmark', '#FF0000')
    end

    local price = 0 -- Would come from config

    if paymentType == 'money' then
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            xPlayer.addWeapon(weapon, 100)
            Zen.Functions.Notify(source, 'Purchased weapon!', 'gun', '#00FF00')
        else
            Zen.Functions.Notify(source, 'Not enough money!', 'dollar', '#FF0000')
        end
    end
end)
