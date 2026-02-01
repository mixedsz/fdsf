-- Blips Server-side Code
-- Blips are client-side, this file handles any dynamic server blips

-- Add dynamic blip for all players
RegisterNetEvent('blips:add', function(coords, data)
    local source = source
    TriggerClientEvent('blips:add', -1, coords, data)
end)

-- Remove dynamic blip
RegisterNetEvent('blips:remove', function(blipId)
    local source = source
    TriggerClientEvent('blips:remove', -1, blipId)
end)
