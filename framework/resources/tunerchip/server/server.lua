-- Tuner Chip Server-side Code

-- Register tuner chip as usable item
CreateThread(function()
    Wait(1000)

    ESX.RegisterUsableItem('tunerchip', function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then return end

        TriggerClientEvent('tunerchip:use', source)
    end)
end)

-- Remove tuner chip after use
RegisterNetEvent('tunerchip:used', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    xPlayer.removeInventoryItem('tunerchip', 1)
    Zen.Functions.Notify(source, 'Tuner chip applied!', 'gear', '#00FF00')
end)
