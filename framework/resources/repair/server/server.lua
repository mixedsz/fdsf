-- Repair Server-side Code
local Repair = Zen.Config.Repair

-- Repair vehicle (if using item)
RegisterNetEvent('repair:use', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local repairItem = xPlayer.getInventoryItem('repairkit')
    if repairItem and repairItem.count > 0 then
        xPlayer.removeInventoryItem('repairkit', 1)
        TriggerClientEvent('repair:start', source)
        Zen.Functions.Notify(source, 'Repairing vehicle...', 'wrench', '#0EA5E9')
    else
        Zen.Functions.Notify(source, 'You need a repair kit!', 'wrench', '#EC4899')
    end
end)
