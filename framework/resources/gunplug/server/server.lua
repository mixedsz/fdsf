-- Gun Plug Server-side Code

RegisterNetEvent('addWeaponToInventory', function(weapon, ammo)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    ammo = ammo or 100
    xPlayer.addWeapon(weapon, ammo)
    Zen.Functions.Notify(source, 'Received weapon!', 'gun', '#00FF00')
end)
