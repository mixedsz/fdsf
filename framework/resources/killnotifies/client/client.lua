AddEventHandler('gameEventTriggered', function(name, data)
    if name == "CEventNetworkEntityDamage" then
        victim = tonumber(data[1])
        attacker = tonumber(data[2])
        victimDied = tonumber(data[6]) == 1 and true or false 
        weaponHash = tonumber(data[7])
        isMeleeDamage = tonumber(data[10]) ~= 0 and true or false 
        local location = nil
        vehicleDamageTypeFlag = tonumber(data[11]) 
        local FoundLastDamagedBone, LastDamagedBone = GetPedLastDamageBone(victim)
        local bonehash = -1
        if FoundLastDamagedBone then
            bonehash = tonumber(LastDamagedBone)
        end
        local PPed = cache.ped
        local distance = IsEntityAPed(attacker) and #(GetEntityCoords(attacker) - GetEntityCoords(victim)) or -1
        local isplayer = IsPedAPlayer(attacker)
        local attackerid = isplayer and GetPlayerServerId(NetworkGetPlayerIndexFromPed(attacker)) or tostring(attacker==-1 and " " or attacker)
        local deadid = isplayer and GetPlayerServerId(NetworkGetPlayerIndexFromPed(victim)) or tostring(victim==-1 and " " or victim)
        local victimName = GetPlayerName(NetworkGetPlayerIndexFromPed(victim)) or tostring(victim==-1 and " " or victim)
        local attackerName = GetPlayerName(NetworkGetPlayerIndexFromPed(attacker)) or tostring(attacker==-1 and " " or attacker)

        if IsEntityDead(victim) and not isMeleeDamage and IsPedAPlayer(victim) then
            for i = 1, #config.killfeedLocations do
                local data = config.killfeedLocations[i]
                if #(GetEntityCoords(PPed) - data.coords) < data.radius and #(GetEntityCoords(attacker) - data.coords) < data.radius then
                    local attacker = {name = attackerName, id = attackerid}
                    local victim = {name = victimName, id = deadid}

                    SendNUIMessage({
                        action = 'Killfeed',
                        headshot = bonehash == 31086,
                        me = PPed == attacker or PPed == victim,
                        attacker = attacker,
                        victim = victim,
                    })
                    break
                end
            end
        end

        if victim == attacker or attacker ~= PPed or not IsPedAPlayer(victim) or not IsPedAPlayer(attacker) then return end

        if IsEntityDead(victim) then
            -- SendNUIMessage({
            --     action = 'playerKilled',
            --     name = victimName,
            --     id = deadid,
            -- })
        end
    end
end)