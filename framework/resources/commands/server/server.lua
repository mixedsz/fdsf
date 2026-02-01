-- Commands Server-side Code

-- Me command - broadcast to nearby players
lib.callback.register('me:nearby', function(source, message)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    local coords = xPlayer.getCoords()

    -- Get nearby players
    for _, playerId in pairs(GetPlayers()) do
        local xTarget = ESX.GetPlayerFromId(playerId)
        if xTarget then
            local targetCoords = xTarget.getCoords()
            local distance = #(vec3(coords.x, coords.y, coords.z) - vec3(targetCoords.x, targetCoords.y, targetCoords.z))

            if distance < 20.0 then
                TriggerClientEvent('me:display', playerId, source, message)
            end
        end
    end

    return true
end)
