-- Robbery Server-side Code
local Robbery = Zen.Config.Robbery
local activRobberies = {}
local robberyCooldowns = {}

RegisterNetEvent('robbery:start', function(storeIndex)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local storeData = Robbery.Locations[storeIndex]
    if not storeData then return end

    -- Check cooldown
    if robberyCooldowns[storeIndex] and robberyCooldowns[storeIndex] > os.time() then
        local remaining = robberyCooldowns[storeIndex] - os.time()
        return Zen.Functions.Notify(source, 'This store is on cooldown! ' .. remaining .. 's remaining', 'clock', '#EC4899')
    end

    -- Check if robbery is already active
    if activRobberies[storeIndex] then
        return Zen.Functions.Notify(source, 'This store is already being robbed!', 'xmark', '#EC4899')
    end

    -- Check minimum police
    local policeCount = 0
    for _, playerId in pairs(GetPlayers()) do
        local xTarget = ESX.GetPlayerFromId(playerId)
        if xTarget and xTarget.getJob().name == 'police' then
            policeCount = policeCount + 1
        end
    end

    local minPolice = Zen.Config.Server.Robbery and Zen.Config.Server.Robbery.MinPolice or 0
    if policeCount < minPolice then
        return Zen.Functions.Notify(source, 'Not enough police online! (' .. policeCount .. '/' .. minPolice .. ')', 'shield', '#EC4899')
    end

    -- Start robbery
    activRobberies[storeIndex] = {
        player = source,
        startTime = os.time()
    }

    -- Notify player
    TriggerClientEvent('robbery:start', source, storeIndex)

    -- Create blip for police
    TriggerClientEvent('robbery:blip', -1, storeIndex, storeData.coords)

    -- Notify police
    for _, playerId in pairs(GetPlayers()) do
        local xTarget = ESX.GetPlayerFromId(playerId)
        if xTarget and xTarget.getJob().name == 'police' then
            Zen.Functions.Notify(playerId, 'A robbery is in progress at ' .. storeData.name .. '!', 'siren', '#EC4899')
        end
    end

    -- Start robbery timer
    local timer = storeData.timers[1]

    SetTimeout(timer * 1000, function()
        if activRobberies[storeIndex] and activRobberies[storeIndex].player == source then
            -- Give reward
            local reward = math.random(storeData.reward[1], storeData.reward[2])
            xPlayer.addAccountMoney('black_money', reward)

            Zen.Functions.Notify(source, 'Robbery complete! You got $' .. reward .. ' dirty money!', 'money-bill', '#0EA5E9')

            -- Stop robbery
            activRobberies[storeIndex] = nil

            -- Remove blip
            TriggerClientEvent('robbery:blip:remove', -1, storeIndex)

            -- Stop client robbery UI
            TriggerClientEvent('robbery:stop', source)

            -- Set cooldown
            local cooldown = Zen.Config.Server.Robbery and Zen.Config.Server.Robbery.Cooldown or 300
            robberyCooldowns[storeIndex] = os.time() + cooldown

            Zen.Functions.Log('Robbery Complete', ('%s completed robbery at %s and received $%s'):format(
                xPlayer.getName(), storeData.name, reward
            ), 16776960)
        end
    end)

    Zen.Functions.Log('Robbery Started', ('%s started robbing %s'):format(xPlayer.getName(), storeData.name), 16711680)
end)

RegisterNetEvent('robbery:exited', function(storeIndex)
    local source = source

    if activRobberies[storeIndex] and activRobberies[storeIndex].player == source then
        activRobberies[storeIndex] = nil

        -- Remove blip
        TriggerClientEvent('robbery:blip:remove', -1, storeIndex)

        Zen.Functions.Notify(source, 'You left the robbery area!', 'xmark', '#EC4899')

        Zen.Functions.Log('Robbery Failed', ('%s left the robbery area'):format(GetPlayerName(source)), 16711680)
    end
end)
