local IdsToggled = true
local idsThreadRunning = false

local function toggleIds()
    if idsThreadRunning then return end
    idsThreadRunning = true

    CreateThread(function()
        while IdsToggled do
            local wait = 1000
            local playerCoords = GetEntityCoords(cache.ped)
            local players = lib.getNearbyPlayers(playerCoords, 50.0, false) -- Increased range to 50m

            if players and #players > 0 then
                wait = 0

                for _, value in pairs(players) do
                    local playerId = value.id
                    local serverId = GetPlayerServerId(playerId)
                    local pedCoords = GetEntityCoords(GetPlayerPed(playerId))

                    if serverId > 0 then
                        Zen.Functions.DrawText(tostring(serverId), pedCoords + vec3(0, 0, 1.0), NetworkIsPlayerTalking(playerId))
                    end
                end
            end

            Wait(wait)
        end
        idsThreadRunning = false
    end)
end

-- Start IDs on resource start
CreateThread(function()
    Wait(2000) -- Wait for player to load
    if IdsToggled then
        toggleIds()
    end
end)

RegisterCommand('ids', function()
    IdsToggled = not IdsToggled

    if IdsToggled then
        Zen.Functions.Notify('Player IDs enabled', 'eye', '#0EA5E9')
        toggleIds()
    else
        Zen.Functions.Notify('Player IDs disabled', 'eye-slash', '#EC4899')
    end
end, false)
