-- Drugs Server-side Code

RegisterNetEvent('drugs:receive', function(items)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if not items or type(items) ~= 'table' then return end

    for _, item in pairs(items) do
        if item.name and item.amount then
            if xPlayer.canCarryItem(item.name, item.amount) then
                xPlayer.addInventoryItem(item.name, item.amount)
            else
                Zen.Functions.Notify(source, 'Inventory full!', 'box', '#FF0000')
                TriggerClientEvent('drugs:stop', source, {}, 'Processing')
                return
            end
        end
    end
end)
