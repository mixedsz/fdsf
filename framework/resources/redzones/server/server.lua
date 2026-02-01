-- Redzones Server-side Code
local Redzone = Zen.Config.Redzones
local playerKills = {}

RegisterNetEvent('redzones:action', function(action, zoneId)
    local source = source

    if action == 'enter' then
        playerKills[source] = playerKills[source] or 0

        -- Give weapons on enter
        if Redzone.Weapons and Redzone.Weapons.OnEnter then
            for _, weapon in pairs(Redzone.Weapons.OnEnter) do
                TriggerClientEvent('redzones:give:weapon', source, 'enter', weapon)
            end
        end
    elseif action == 'exit' then
        -- Remove weapons on exit
        if Redzone.Weapons and Redzone.Weapons.OnEnter then
            for _, weapon in pairs(Redzone.Weapons.OnEnter) do
                TriggerClientEvent('redzones:give:weapon', source, 'exit', weapon)
            end
        end

        -- Give rewards
        local kills = playerKills[source] or 0
        if kills > 0 then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer then
                local zoneData = Redzone.Zones[zoneId]
                local reward = kills * (zoneData and zoneData.reward or 500)

                xPlayer.addAccountMoney('black_money', reward)
                Zen.Functions.Notify(source, 'You earned $' .. reward .. ' for ' .. kills .. ' kills!', 'dollar', '#00FF00')
            end
        end

        playerKills[source] = 0
    end
end)

RegisterNetEvent('redzones:killed', function(killerId, reward, zoneName, headshot)
    local source = source

    -- Increment killer's kill count
    playerKills[killerId] = (playerKills[killerId] or 0) + 1

    -- Add headshot bonus
    if headshot then
        local bonus = Zen.Config.Server.Redzones and Zen.Config.Server.Redzones.HeadshotBonus or 500
        reward = reward + bonus
    end

    -- Notify killer
    TriggerClientEvent('redzones:kills', killerId, playerKills[killerId], headshot)

    -- Give instant reward
    local xKiller = ESX.GetPlayerFromId(killerId)
    if xKiller then
        xKiller.addAccountMoney('black_money', reward)
    end
end)
