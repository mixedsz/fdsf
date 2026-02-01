-- Kill Notifies Server-side Code

-- Broadcast kill notification
RegisterNetEvent('killnotifies:broadcast', function(killerId, victimId, weapon)
    local killerName = GetPlayerName(killerId) or 'Unknown'
    local victimName = GetPlayerName(victimId) or 'Unknown'

    TriggerClientEvent('killnotifies:display', -1, killerName, victimName, weapon)
end)
