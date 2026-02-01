-- Player IDs Server-side Code
-- Player ID display is client-side

-- Get player list for ID display
lib.callback.register('playerids:getPlayers', function(source)
    local players = {}

    for _, playerId in pairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            players[#players + 1] = {
                id = tonumber(playerId),
                name = xPlayer.getName()
            }
        end
    end

    return players
end)
