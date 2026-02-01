-- Usable Items Server-side Code

RegisterNetEvent('usable:remove', function(item, count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    count = count or 1

    local playerItem = xPlayer.getInventoryItem(item)
    if playerItem and playerItem.count >= count then
        xPlayer.removeInventoryItem(item, count)
    end
end)

-- Register usable items
CreateThread(function()
    Wait(1000) -- Wait for ESX to load

    -- Register common usable items
    local usableItems = {
        'medkit',
        'armour',
        'repairkit',
        'lockpick',
        'water',
        'bread',
        'phone'
    }

    for _, item in pairs(usableItems) do
        ESX.RegisterUsableItem(item, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            if not xPlayer then return end

            -- Remove item and trigger client use
            xPlayer.removeInventoryItem(item, 1)
            TriggerClientEvent('usable:use', source, item)
        end)
    end
end)
