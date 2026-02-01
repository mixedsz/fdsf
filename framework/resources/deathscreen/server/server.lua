-- Deathscreen Server-side Code

-- Check balance for revive
lib.callback.register('deathscreen:checkBalance', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Return player's bank balance
    return xPlayer.getAccount('bank').money
end)

-- Perform after death actions
RegisterNetEvent('deathscreen:performAfterDeath', function(action, cost)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if action == 'hospital' then
        -- Check and deduct cost
        if cost and cost > 0 then
            local bankBalance = xPlayer.getAccount('bank').money
            if bankBalance >= cost then
                xPlayer.removeAccountMoney('bank', cost)
                Zen.Functions.Notify(source, 'Hospital bill: $' .. cost, 'hospital', '#FF0000')
            end
        end
    end
end)

-- ESX on player spawn event relay
RegisterNetEvent('esx:onPlayerSpawn', function()
    local source = source
    -- Handle any spawn logic here
end)
