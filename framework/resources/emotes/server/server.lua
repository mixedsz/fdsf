-- Emotes Server-side Code
-- Handles syncing emotes between players

RegisterNetEvent('scully_emotemenu:removeProps', function()
    local source = source
    TriggerClientEvent('scully_emotemenu:removeProps', -1, source)
end)

RegisterNetEvent('scully_emotemenu:requestSynchronizedEmote', function(targetId, emote)
    local source = source
    TriggerClientEvent('scully_emotemenu:synchronizedEmoteRequest', targetId, source, emote)
end)

RegisterNetEvent('scully_emotemenu:syncPtfx', function(asset, name, offset, rot, scale, duration)
    local source = source
    TriggerClientEvent('scully_emotemenu:syncPtfx', -1, source, asset, name, offset, rot, scale, duration)
end)

RegisterNetEvent('scully_emotemenu:cancelSynchronizedEmote', function(targetId)
    local source = source
    TriggerClientEvent('scully_emotemenu:cancelSynchronizedEmote', targetId, source)
end)

RegisterNetEvent('scully_emotemenu:createProp', function(prop, bone, offset, rot)
    local source = source
    TriggerClientEvent('scully_emotemenu:createProp', -1, source, prop, bone, offset, rot)
end)

RegisterNetEvent('scully_emotemenu:requestAttach', function(targetId, bone, offset, rot)
    local source = source
    TriggerClientEvent('scully_emotemenu:attachRequest', targetId, source, bone, offset, rot)
end)

RegisterNetEvent('scully_emotemenu:syncProp', function(prop, bone, offset, rot)
    local source = source
    TriggerClientEvent('scully_emotemenu:syncProp', -1, source, prop, bone, offset, rot)
end)

RegisterNetEvent('scully_emotemenu:synchronizedEmoteResponse', function(targetId, accepted, emote)
    local source = source
    TriggerClientEvent('scully_emotemenu:synchronizedEmoteResponse', targetId, source, accepted, emote)
end)

RegisterNetEvent('scully_emotemenu:setPropWhitelist', function(props)
    local source = source
    -- Handle prop whitelist if needed
end)
