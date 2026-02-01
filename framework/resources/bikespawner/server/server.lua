-- Bike Spawner Server-side Code
-- Bike spawning is client-side, this handles any server validation

RegisterNetEvent('bikespawner:spawn', function(model)
    local source = source
    -- Validate model if needed
    TriggerClientEvent('bikespawner:spawn', source, model)
end)
