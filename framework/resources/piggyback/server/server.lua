-- Piggyback Server-side Code

RegisterNetEvent('piggyback:sync', function(targetId)
    local source = source
    TriggerClientEvent('piggyback:sync', targetId, source)
end)

RegisterNetEvent('piggyback:stop', function(targetId)
    local source = source
    TriggerClientEvent('piggyback:stop', targetId, source)
    TriggerClientEvent('piggyback:stop', source, targetId)
end)
