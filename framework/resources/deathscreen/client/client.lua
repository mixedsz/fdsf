local DeathScreen = Zen.Config.DeathScreen
playerDead = false

CreateThread(function()
    Zen.Functions.NUI('updateButtons', { buttons = DeathScreen.Buttons })
end)

for i = 1, #DeathScreen.Hospitals.Locations do
    Zen.Functions.CreateBlip(DeathScreen.Hospitals.Locations[i], DeathScreen.Hospitals.Blip)
end

RegisterNUICallback('checkingIfPlayersInZones', function(_, callback)
    CreateThread(function()
        while true do 
            Wait(0)
            if not playerDead then 
                Zen.Functions.NUI('closeDeathScreen', {})
                playerDead = false
                ToggleUIs(true)
                break
            end

            local zone = 0
            local zoneDistance = math.huge
            
            for i = 1, #DeathScreen.ReviveZones do
                local playerCoords = cache.coords
                local distance = math.sqrt((playerCoords.x - DeathScreen.ReviveZones[i].coords[1])^2 + (playerCoords.y - DeathScreen.ReviveZones[i].coords[2])^2 + (playerCoords.z - DeathScreen.ReviveZones[i].coords[3])^2)

                if distance <= DeathScreen.ReviveZones[i].distance and distance < zoneDistance then
                    zone = i
                    zoneDistance = distance
                end
            end

            if zone ~= 0 then
                if playerDead then 
                    Zen.Functions.NUI('showDeathScreenZones', { inZone = true })

                    if IsControlPressed(0, 45) then
                        SetEntityCoordsNoOffset(cache.ped, cache.coords.x, cache.coords.y, cache.coords.z, false, false, false)
                        NetworkResurrectLocalPlayer(cache.coords.x, cache.coords.y, cache.coords.z, cache.coords.w or 0.0, true, false)
                        ClearPedBloodDamage(cache.ped)
                        TriggerEvent('playerSpawned')
                        Zen.Functions.NUI('closeDeathScreen', {})
                        ToggleUIs(true)
                        playerDead = false
                        break
                    end
                end
            else
                Zen.Functions.NUI('showDeathScreenZones', { inZone = false })
            end
        end
    end)

    return callback('ok')
end)

function isNearRampZone(type)
    local zones = 0
    local zoneDistances = math.huge
    local playerCoords = cache.coords
    local location = nil

    for i = 1, #DeathScreen.ReviveZones do
        local zoneCoords = DeathScreen.ReviveZones[i].coords
        local zoneName = DeathScreen.ReviveZones[i].label
        local distance = math.sqrt((playerCoords.x - zoneCoords[1])^2 + (playerCoords.y - zoneCoords[2])^2 + (playerCoords.z - zoneCoords[3])^2)
        
        if distance <= DeathScreen.ReviveZones[i].distance and distance < zoneDistances then
            zones = i
            zoneDistances = distance
            location = zoneName
        end
    end

    if zones ~= 0 then
        if notifyActive then return end
        return true
    else
        if type == "combatheals" then 
            Zen.Functions.Notify('You are not near a wager zone', 'xmark', '#FB010F')
            return false
        end

        return false
    end
end

RegisterCommand('ammo', function()
    if isNearRampZone("combatheals") then
        if IsPedArmed(PlayerPedId(), 4) then
            hash = GetSelectedPedWeapon(PlayerPedId())
            if hash ~= nil then
                AddAmmoToPed(PlayerPedId(), hash, 900)
            else
                Zen.Functions.Notify('You Arent Holding A Weapon', 'xmark', '#FF0000')
            end
        end
    end
end)

RegisterCommand('r', function()
    if isNearRampZone("combatheals") then
        if IsEntityDead(PlayerPedId()) then
            TriggerEvent('deathscreen:revive', source)
        else
            Zen.Functions.Notify('You cannot do this while alive.', 'xmark', '#FB010F')
            return end
    end
end)

RegisterCommand('a', function()
    if isNearRampZone("combatheals") then
        if IsEntityDead(PlayerPedId()) then
            Zen.Functions.Notify('You cannot do this while dead.', 'xmark', '#FB010F')
            return
        end
        if armorCooldown then
            return
        end
        if GetPedArmour(PlayerPedId()) < 100 then
            SetPedArmour(PlayerPedId(), 100)
            armorCooldown = true
            Zen.Functions.Notify('Your armour has been replenished', 'shield', '#FB010F')
            Wait(5000)
            armorCooldown = false
        end    
    end
end)

RegisterCommand('h', function()
    if isNearRampZone("combatheals") then
        if IsEntityDead(PlayerPedId()) then
            Zen.Functions.Notify('You cannot do this while dead.', 'xmark', '#FB010F')
            return
        end
        if healthCooldown then
            return
        end
        if GetEntityHealth(PlayerPedId()) < 200 then
            SetEntityHealth(PlayerPedId(), 200)
            healthCooldown = true
            Zen.Functions.Notify('Your health has been replenished', 'heart', '#FB010F')
            Wait(5000)
            healthCooldown = false
        else
            Zen.Functions.Notify('Your health is already full.', 'xmark', '#FB010F')
        end   
    end
end)

RegisterNUICallback('respawnTimerFinished', function(_, callback)
    CreateThread(function()
        while true do 
            Wait(0)
            if not playerDead then 
                Zen.Functions.NUI('closeDeathScreen', {})
                playerDead = false
                break
            end
            for i = 1, #DeathScreen.Buttons do 
                if Zen.Keys[DeathScreen.Buttons[i].key] == "R" then 
                    ExecuteCommand('revive ' ..cache.ped)
                    return callback('ok')
                end

                if IsControlPressed(0, Zen.Keys[DeathScreen.Buttons[i].key]) then
                    local canPayAmount = lib.callback.await('deathscreen:checkBalance', false, DeathScreen.Buttons[i].price)
                    if canPayAmount then 
                        RespawnPlayerAt(DeathScreen.Buttons[i], true)
                        break
                    end
                end
            end
        end
    end)

    return callback('ok')
end)

RegisterNUICallback('bleedoutTimerFinished', function(_, callback)
    RespawnPlayerAt({
        coords = DeathScreen.Hospitals.Locations[math.random(1, #DeathScreen.Hospitals.Locations)]
    }, true)
    return callback('ok')
end)


function RespawnPlayerAt(data, atPD)
    local coords = data.coords
    local isPolice = (stateBag.job and stateBag.job.name == 'police')
    if isPolice and atPD then
        coords = DeathScreen.PoliceStation
    end

    SetEntityCoordsNoOffset(cache.ped, coords.x, coords.y, coords.z, false, false, false)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.w, true, false)
    ClearPedBloodDamage(cache.ped)
    TriggerEvent('playerSpawned')

    TriggerServerEvent('deathscreen:performAfterDeath', {
        coords = coords,
        weapon = data.weapon,
        atPD = atPD
    })

    Zen.Functions.NUI('closeDeathScreen', {})
    ToggleUIs(true)
    playerDead = false
end

AddEventHandler('esx:onPlayerDeath', function(data)
    local weaponlabel
    local deathCause = data.deathCause
    local weaponskilledby = Zen.HashKey[deathCause]

    ToggleUIs(false)

    if deathCause == -460377800 then 
        weaponlabel = "AR15 Black"
    elseif deathCause == -497203000 then 
        weaponlabel = "AR15 Purple"
    elseif deathCause == -623131688 then 
        weaponlabel = "AR15 Blue"
    elseif deathCause == -1925800258 then 
        weaponlabel = "AR15 White"
    elseif deathCause == -1736273989 then 
        weaponlabel = "AR15 Yellow"
    elseif deathCause == 1942841862 then 
        weaponlabel = "AR15 Orange"
    elseif deathCause == -887961548 then 
        weaponlabel = "AR15 Green"
    else 
        weaponlabel = Zen.Weapons[weaponskilledby]
    end
    
    if data.killedByPlayer then
        deathReason = GetPlayerName(GetPlayerFromServerId(data.killerServerId))..' ('..data.killerServerId..')'
    elseif not data.killedByPlayer then
        deathReason = 'Commited Suicide'
    end

    playerDead = true

    Zen.Functions.NUI('showDeathScreen', {
        reason = deathReason,
        buttons = isNearRampZone("") and {{ label = "Revive Player", price = 0, key = "R" }} or DeathScreen.Buttons,
        respawnTimer = (DeathScreen.OnDeath.RespawnTime / 1000), 
        bleedOutTimer = (DeathScreen.OnDeath.BleedoutTime / 1000)
    })
end)

RegisterNetEvent('deathscreen:revive', function(coords)
    NetworkResurrectLocalPlayer((coords or cache.coords), true, true, false)
    ClearPedBloodDamage(cache.ped)
    TriggerServerEvent('esx:onPlayerSpawn')
    TriggerEvent('esx:onPlayerSpawn')
    TriggerEvent('playerSpawned')

    Zen.Functions.NUI('closeDeathScreen', {})
    playerDead = false

    ToggleUIs(true)
end)

RegisterCommand('die', function()
    if not Zen.Functions.CanInteract() then 
        return Zen.Functions.Notify('Can\'t Do This Right Now!', 'xmark', '#FB010F')
    end

    SetEntityHealth(cache.ped, 0)
    playerDead = true
end)