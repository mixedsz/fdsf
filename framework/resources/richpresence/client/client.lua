local Server = Zen.Config.Server
local RichPresence = Zen.Config.RichPresence

local playerCountText = "Loading..."

RegisterNetEvent('richpresence:updatePlayerCount')
AddEventHandler('richpresence:updatePlayerCount', function(count)
    playerCountText = "[" .. count .. "] Players"
end)

CreateThread(function()
    while true do
        TriggerServerEvent('richpresence:requestPlayerCount')
        Wait(30 * 1000)
    end
end)

CreateThread(function()
    local name = GetPlayerName(cache.playerId)

    while true do
        SetDiscordAppId(RichPresence.AppId)
        SetDiscordRichPresenceAsset(RichPresence.Asset)
        SetDiscordRichPresenceAssetText('discord.gg/'..Server.DiscordInvite..'')
        SetRichPresence(playerCountText)
        SetDiscordRichPresenceAssetText(('ID: %s | %s'):format(cache.serverId, name))
        SetDiscordRichPresenceAction(0, RichPresence.Actions[1][1], RichPresence.Actions[1][2])
        SetDiscordRichPresenceAction(1, RichPresence.Actions[2][1], RichPresence.Actions[2][2])
        
        Wait(5 * 1000)
    end
end)