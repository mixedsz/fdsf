-- Rich Presence Server-side Code

-- Update player count periodically
CreateThread(function()
    while true do
        Wait(30000) -- Every 30 seconds

        local playerCount = #GetPlayers()
        TriggerClientEvent('richpresence:updatePlayerCount', -1, playerCount)
    end
end)

-- Request player count
RegisterNetEvent('richpresence:requestPlayerCount', function()
    local source = source
    TriggerClientEvent('richpresence:updatePlayerCount', source, #GetPlayers())
end)
