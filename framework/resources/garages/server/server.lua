-- Garages Server-side Code

-- Give vehicle to another player
RegisterNetEvent('garages:give', function(targetId, plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then
        return Zen.Functions.Notify(source, 'Player not found!', 'xmark', '#FF0000')
    end

    -- Verify ownership
    local vehicle = MySQL.single.await('SELECT * FROM owned_vehicles WHERE plate = ? AND owner = ?', {
        plate, xPlayer.identifier
    })

    if not vehicle then
        return Zen.Functions.Notify(source, 'You don\'t own this vehicle!', 'car', '#FF0000')
    end

    -- Transfer ownership
    MySQL.update.await('UPDATE owned_vehicles SET owner = ? WHERE plate = ?', {
        xTarget.identifier, plate
    })

    Zen.Functions.Notify(source, 'Vehicle transferred!', 'car', '#00FF00')
    Zen.Functions.Notify(targetId, 'You received a vehicle! Plate: ' .. plate, 'car', '#00FF00')

    Zen.Functions.Log('Vehicle Transfer', ('%s transferred vehicle %s to %s'):format(
        xPlayer.getName(), plate, xTarget.getName()
    ), 65280)
end)

-- Delete vehicle
RegisterNetEvent('garages:delete', function(plate)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Verify ownership
    local vehicle = MySQL.single.await('SELECT * FROM owned_vehicles WHERE plate = ? AND owner = ?', {
        plate, xPlayer.identifier
    })

    if not vehicle then
        return Zen.Functions.Notify(source, 'You don\'t own this vehicle!', 'car', '#FF0000')
    end

    -- Delete vehicle
    MySQL.query.await('DELETE FROM owned_vehicles WHERE plate = ?', { plate })

    Zen.Functions.Notify(source, 'Vehicle deleted!', 'car', '#00FF00')

    Zen.Functions.Log('Vehicle Deleted', ('%s deleted vehicle %s'):format(xPlayer.getName(), plate), 16711680)
end)
