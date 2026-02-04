-- Deathscreen Server-side Code

local function getESX()
    if not ESX then
        pcall(function()
            ESX = exports['es_extended']:getSharedObject()
        end)
    end
    return ESX
end

-- Perform after death actions (money deduction + weapon giving)
RegisterNetEvent('deathscreen:performAfterDeath', function(cost, weapon)
    local source = source
    local esx = getESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Deduct respawn cost from bank
    if cost and cost > 0 then
        local bankBalance = xPlayer.getAccount('bank').money
        if bankBalance >= cost then
            xPlayer.removeAccountMoney('bank', cost)
            TriggerClientEvent('showNotification', source, 'Respawn cost: $' .. cost, 'dollar', '#EC4899')
        else
            -- Try cash if bank doesn't have enough
            local cashBalance = xPlayer.getMoney()
            if cashBalance >= cost then
                xPlayer.removeMoney(cost)
                TriggerClientEvent('showNotification', source, 'Respawn cost: $' .. cost, 'dollar', '#EC4899')
            end
        end
    end

    -- Give weapon if specified
    if weapon and weapon ~= '' then
        xPlayer.addWeapon(weapon, 250)
    end
end)

-- Revive player from server (admin command etc)
RegisterNetEvent('deathscreen:adminRevive', function(targetId)
    local source = source
    local esx = getESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Check admin permission
    local group = xPlayer.getGroup()
    if group ~= 'admin' and group ~= 'superadmin' then return end

    local target = targetId or source
    TriggerClientEvent('deathscreen:revive', target)
end)

-- ESX on player spawn event relay
RegisterNetEvent('esx:onPlayerSpawn', function()
    local source = source
    -- Handle any spawn logic here
end)
