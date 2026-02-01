-- Needs Server-side Code (Hunger/Thirst/Society)

-- ESX Society events are already handled in util/server/events.lua
-- This file handles any additional needs-specific logic

-- Update player needs
RegisterNetEvent('needs:update', function(hunger, thirst)
    local source = source
    local ply = Player(source)
    ply.state:set('hunger', hunger, true)
    ply.state:set('thirst', thirst, true)
end)

-- Consume food/water item
RegisterNetEvent('needs:consume', function(item, hungerRestore, thirstRestore)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local playerItem = xPlayer.getInventoryItem(item)
    if playerItem and playerItem.count > 0 then
        xPlayer.removeInventoryItem(item, 1)
        TriggerClientEvent('needs:restore', source, hungerRestore or 0, thirstRestore or 0)
    end
end)
