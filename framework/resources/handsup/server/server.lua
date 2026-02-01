-- Hands Up Server-side Code

RegisterNetEvent('force:surrender', function(targetId)
    local source = source
    TriggerClientEvent('force:surrender', targetId)
end)
