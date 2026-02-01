-- Leaderboard Server-side Code

-- Sync gang change to leaderboard
RegisterNetEvent('gangs:change', function(gangData)
    local source = source
    -- Broadcast gang change to all clients for leaderboard update
    TriggerClientEvent('gangs:change', -1, gangData)
end)
