-- Police Server-side Code
local Police = Zen.Config.Police
local evidenceLocker = {}

-- Police permission check callback
lib.callback.register('police:checkPermission', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    return xPlayer.getJob().name == 'police'
end)

-- Get billing for player
lib.callback.register('billing:get', function(source, targetId)
    local xTarget = ESX.GetPlayerFromId(targetId)
    if not xTarget then return {} end

    local result = MySQL.query.await('SELECT * FROM billing WHERE identifier = ? AND paid = 0', { xTarget.identifier })
    local bills = {}

    for _, bill in pairs(result or {}) do
        bills[#bills + 1] = {
            id = bill.id,
            label = bill.label,
            amount = bill.amount
        }
    end

    return bills
end)

-- Vehicle lookup
lib.callback.register('police:interaction:vehicles', function(source, plate)
    local result = MySQL.single.await('SELECT ov.*, u.firstname, u.lastname FROM owned_vehicles ov LEFT JOIN users u ON ov.owner = u.identifier WHERE ov.plate = ?', { plate })

    if result then
        local owner = (result.firstname or 'Unknown') .. ' ' .. (result.lastname or '')
        return true, result.vehicle, owner
    end

    return false, nil, nil
end)

-- Get evidence items
lib.callback.register('police:evidence:items', function(source)
    local result = MySQL.query.await('SELECT * FROM police_evidence WHERE count > 0')
    local items = {}

    for _, item in pairs(result or {}) do
        items[#items + 1] = {
            name = item.item,
            count = item.count
        }
    end

    return items
end)

-- Buy police vehicle
lib.callback.register('police:vehicles:buy', function(source, props, vehicleType, price, label)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    if xPlayer.getJob().name ~= 'police' then return false end

    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)

        MySQL.insert.await('INSERT INTO owned_vehicles (owner, plate, vehicle, type, job) VALUES (?, ?, ?, ?, ?)', {
            xPlayer.identifier, props.plate, json.encode(props), vehicleType, 'police'
        })

        Zen.Functions.Notify(source, 'Vehicle purchased!', 'car', '#00FF00')
        return true
    else
        Zen.Functions.Notify(source, 'Not enough money!', 'dollar', '#FF0000')
        return false
    end
end)

-- Police citizen actions
RegisterNetEvent('police:interaction:citizen:action', function(targetId, action)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer or xPlayer.getJob().name ~= 'police' then return end

    if action == 'handcuff' then
        TriggerClientEvent('police:interaction:citizen:handcuff', targetId)
    elseif action == 'escort' then
        TriggerClientEvent('police:interaction:citizen:escort', targetId, source)
    elseif action == 'vehicle' then
        TriggerClientEvent('police:interaction:citizen:vehicle', targetId)
    end
end)

-- Search confiscate
RegisterNetEvent('police:interaction:citizen:search:confiscate', function(targetId, itemType, itemName, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then return end
    if xPlayer.getJob().name ~= 'police' then return end

    if itemType == 'account' then
        local targetBalance = xTarget.getAccount(itemName).money
        if targetBalance >= amount then
            xTarget.removeAccountMoney(itemName, amount)
            xPlayer.addAccountMoney('money', amount)
            Zen.Functions.Notify(source, 'Confiscated $' .. amount, 'dollar', '#00FF00')
            Zen.Functions.Notify(targetId, 'Police confiscated $' .. amount, 'dollar', '#FF0000')
        end
    elseif itemType == 'item' then
        local targetItem = xTarget.getInventoryItem(itemName)
        if targetItem and targetItem.count >= amount then
            xTarget.removeInventoryItem(itemName, amount)

            -- Add to evidence locker
            local existing = MySQL.single.await('SELECT * FROM police_evidence WHERE item = ?', { itemName })
            if existing then
                MySQL.update.await('UPDATE police_evidence SET count = count + ? WHERE item = ?', { amount, itemName })
            else
                MySQL.insert.await('INSERT INTO police_evidence (item, count) VALUES (?, ?)', { itemName, amount })
            end

            Zen.Functions.Notify(source, 'Confiscated ' .. amount .. 'x ' .. itemName, 'box', '#00FF00')
            Zen.Functions.Notify(targetId, 'Police confiscated ' .. amount .. 'x items', 'box', '#FF0000')
        end
    elseif itemType == 'weapon' then
        xTarget.removeWeapon(itemName)
        Zen.Functions.Notify(source, 'Confiscated weapon', 'gun', '#00FF00')
        Zen.Functions.Notify(targetId, 'Police confiscated your weapon', 'gun', '#FF0000')
    end
end)

-- Take evidence
RegisterNetEvent('police:evidence:take', function(itemName, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if xPlayer.getJob().name ~= 'police' or xPlayer.getJob().grade_name ~= 'boss' then
        return Zen.Functions.Notify(source, 'No permission!', 'xmark', '#FF0000')
    end

    local existing = MySQL.single.await('SELECT * FROM police_evidence WHERE item = ?', { itemName })
    if not existing or existing.count < count then
        return Zen.Functions.Notify(source, 'Not enough in evidence!', 'xmark', '#FF0000')
    end

    if not xPlayer.canCarryItem(itemName, count) then
        return Zen.Functions.Notify(source, 'Inventory full!', 'box', '#FF0000')
    end

    MySQL.update.await('UPDATE police_evidence SET count = count - ? WHERE item = ?', { count, itemName })
    xPlayer.addInventoryItem(itemName, count)

    Zen.Functions.Notify(source, 'Took ' .. count .. 'x from evidence', 'box', '#00FF00')
end)

-- Search nearby player
RegisterNetEvent('police:searchNearbyPlayer', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer or xPlayer.getJob().name ~= 'police' then return end

    -- Open ox_inventory nearby
    exports.ox_inventory:openNearbyInventory()
end)
