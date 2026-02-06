RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')


RegisterCommand("announcesv", function(source, args, raw)
    if source == 0 or source == nil or source == '' then
        print(table.concat(args, " "))
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.41vw; margin: -0.1vw; background-color:  rgba(20255, 0, 205, 1); border-radius: 3px;"><i class="fas fa-cog"></i> SYSTEM:<br> {1}<br></div>',
            args = { "ANNOUNCEMENT", table.concat(args, " ") }
        })
    end
end)

-- Blacklisted words filter
local blacklistedWords = {
    'nigger', 'nigga', 'faggot', 'retard', 'chink', 'spic', 'kike',
    'discord.gg', 'discordapp.com', '.gg/', -- Anti-advertising
}

local function containsBlacklistedWord(message)
    local lowerMsg = string.lower(message)
    for _, word in pairs(blacklistedWords) do
        if string.find(lowerMsg, string.lower(word)) then
            return true, word
        end
    end
    return false, nil
end

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    -- Check for blacklisted words FIRST
    local isBlacklisted, blockedWord = containsBlacklistedWord(message)
    if isBlacklisted then
        -- Notify only the sender that their message was blocked
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: 0.41vw; margin: -0.1vw; background-color: rgba(255, 0, 0, 0.6); border-radius: 3px;"><i class="fas fa-ban"></i> Your message was blocked - contains blacklisted word</div>',
            args = {}
        })
        print('[CHAT BLOCKED] ' .. author .. ' tried to say: ' .. message)
        return -- Don't broadcast the message
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, author,  { 255, 255, 255 }, message)
    end

    print(author .. '^7: ' .. message .. '^7')
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, '/' .. command) 
    end

    CancelEvent()
end)

-- player join messages
AddEventHandler('chat:init', function(args)
    if GetConvarInt('chat_showJoins', 1) == 0 then
      return
    end
    TriggerClientEvent('chat:addMessage', -1, {
       template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.4); width = auto; border-radius: 15px;"><i class="fas fa-users"></i><b>{0}</b> <i>{1}</i></div>',
        args = { "[Player Joined] ".. GetPlayerName(source), " has joined Gulf Coast Redzone Welcome! (discord.gg/bDU43jPvzy)" }
    })
end)

AddEventHandler('playerDropped', function(reason)
    --TriggerClientEvent('chatMessage', -1, '', { 255, 255, 255 }, '^2* ' .. GetPlayerName(source) ..' left PxD V2  (' .. reason .. ')')
end)

-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)

AddEventHandler('explosionEvent', function(sender, data)
    local s, d = sender, data

    if d.explosionType == 0 then
        TriggerEvent("EasyAdmin:banPlayer", sender, "You have been permanently banned from Gulf Coast Redzone for cheating.\nExplosion Exploit: Scale 0.0 (Grenade)\nAppeal @ https://discord.gg/bDU43jPvzy", false, GetPlayerName(source))
        CancelEvent()
    elseif d.explosionType == 1 then
        TriggerEvent("EasyAdmin:banPlayer", sender, "You have been permanently banned from Gulf Coast Redzone for cheating.\nExplosion Exploit: Scale 1.0 (Grenade Launcher)\nThis ban will never expire.\nAppeal @ https://discord.gg/bDU43jPvzy", false, GetPlayerName(source))
        CancelEvent()
    elseif d.explosionType == 2 then
        TriggerEvent("EasyAdmin:banPlayer", sender, "You have been permanently banned from Gulf Coast Redzone for cheating.\nExplosion Exploit: Scale 2.0 (Sticky Bomb)\nThis ban will never expire.\nAppeal @ https://discord.gg/bDU43jPvzy", false, GetPlayerName(source))
        CancelEvent()
    elseif d.explosionType == 3 then
        TriggerEvent("EasyAdmin:banPlayer", sender, "You have been permanently banned from Gulf Coast Redzone for cheating.\nExplosion Exploit: Scale 3.0 (Molotov)\nThis ban will never expire.\nAppeal @ https://discord.gg/bDU43jPvzy", false, GetPlayerName(source))
        CancelEvent()
    elseif d.explosionType == 4 then
        TriggerEvent("EasyAdmin:banPlayer", sender, "You have been permanently banned from Gulf Coast Redzone for cheating.\nExplosion Exploit: Scale 4.0 (Rockets)\nThis ban will never expire.\nAppeal @ https://discord.gg/bDU43jPvzy", false, GetPlayerName(source))
        CancelEvent()
    elseif d.explosionType == 5 then
        TriggerEvent("EasyAdmin:banPlayer", sender, "You have been permanently banned from Gulf Coast Redzone for cheating.\nExplosion Exploit: Scale 5.0 (Tank Shell)\nThis ban will never expire.\nAppeal @ https://discord.gg/bDU43jPvzy", false, GetPlayerName(source))
        CancelEvent()
    elseif d.explosionType == 6 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 6.0 (Hi-Octane)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 7 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 7.0 (Car)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 8 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 8.0 (Plane)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 9 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 9.0 (Gas Pump)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 10 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 10.0 (Bike)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 11 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 11.0 (Steam)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 12 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 12.0 (Flame)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 13 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 13.0 (Water Hydrant)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 14 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 14.0 (Gas Canister)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 15 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 15.0 (Boat)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 16 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 16.0 (Destroyed Ship)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 17 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 17.0 (Truck)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 18 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 18.0 (Bullet)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 19 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 19.0 (Smoke Grenade Launcher)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 13 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 13.0 (Water Hydrant)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 13 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 13.0 (Water Hydrant)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 13 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 13.0 (Water Hydrant)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 13 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 13.0 (Water Hydrant)\nFiltered by Relentless Anticheat")
        CancelEvent()
    elseif d.explosionType == 13 then
        TriggerClientEvent('esx:showNotification', sender, "[EXPLOSION FILTERED]\nScale 13.0 (Water Hydrant)\nFiltered by Relentless Anticheat")
        CancelEvent()
    end

    if d.explosionType ~= 13 then
        print("[EXPLOSION] [DETECTED] [SENDER: "..sender.."] [TYPE: "..data.explosionType.."]")
    end

    if d.explosionType < 0 or d.explosionType > 82 then
        CancelEvent()
        TriggerEvent("venomadmin:banPlayer", source, "You have been permanently banned from Gulf Coast Redzone for cheating.\nYou attemped to bypass the explosion limiter.\nThis ban will never expire.\nAppeal @ https://discord.gg/bDU43jPvzy", false, GetPlayerName(source))
    end
end)



