-- Car Lock Server-side Code

-- Sync car lock state
RegisterNetEvent('carlock:sync', function(vehicleNetId, locked)
    local source = source
    TriggerClientEvent('carlock:sync', -1, vehicleNetId, locked)
end)

-- Give car keys
RegisterNetEvent('carlock:givekeys', function(targetId, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then return end

    -- Verify ownership
    local vehicle = MySQL.single.await('SELECT * FROM owned_vehicles WHERE plate = ? AND owner = ?', {
        plate, xPlayer.identifier
    })

    if vehicle then
        TriggerClientEvent('carlock:receivekeys', targetId, plate)
        Zen.Functions.Notify(source, 'Gave keys to player!', 'key', '#00FF00')
        Zen.Functions.Notify(targetId, 'Received car keys for ' .. plate, 'key', '#00FF00')
    else
        Zen.Functions.Notify(source, 'You don\'t own this vehicle!', 'xmark', '#FF0000')
    end
end)
