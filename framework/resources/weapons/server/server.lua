-- Weapons Server-side Code
-- Handles weapon-related server functions

-- Give weapon to player
RegisterNetEvent('weapons:give', function(targetId, weapon, ammo)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Check if admin
    if xPlayer.getGroup() ~= 'admin' and xPlayer.getGroup() ~= 'superadmin' then
        return
    end

    local xTarget = ESX.GetPlayerFromId(targetId)
    if xTarget then
        xTarget.addWeapon(weapon, ammo or 100)
        Zen.Functions.Notify(targetId, 'You received a weapon!', 'gun', '#0EA5E9')
    end
end)

-- Remove weapon from player
RegisterNetEvent('weapons:remove', function(weapon)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    xPlayer.removeWeapon(weapon)
end)
