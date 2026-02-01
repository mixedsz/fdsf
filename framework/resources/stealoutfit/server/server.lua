-- Steal Outfit Server-side Code

-- Get player outfit callback (already defined in callbacks.lua)
-- This file handles any additional outfit stealing logic

RegisterNetEvent('stealoutfit:steal', function(targetId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then return end

    -- Get target's outfit
    local outfit = lib.callback.await('stableDev:server:getPlayerOutfit', source, targetId)

    if outfit then
        TriggerClientEvent('stealoutfit:apply', source, outfit)
        Zen.Functions.Notify(source, 'Outfit stolen!', 'shirt', '#00FF00')
        Zen.Functions.Notify(targetId, 'Someone stole your outfit!', 'shirt', '#FF0000')
    end
end)
