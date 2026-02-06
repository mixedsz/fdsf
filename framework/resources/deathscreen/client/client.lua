local DeathScreen = Zen.Config.DeathScreen
playerDead = false

-- Key mappings for deathscreen buttons
local KeyMappings = {
    ['E'] = 38,  -- INPUT_PICKUP / E key
    ['F'] = 23,  -- INPUT_ENTER / F key
    ['G'] = 47,  -- INPUT_DETONATE / G key
    ['R'] = 45,  -- INPUT_RELOAD / R key
    ['H'] = 74,  -- INPUT_VEH_HEADLIGHT / H key
}

CreateThread(function()
    Zen.Functions.NUI('updateButtons', { buttons = DeathScreen.Buttons })
end)

for i = 1, #DeathScreen.Hospitals.Locations do
    Zen.Functions.CreateBlip(DeathScreen.Hospitals.Locations[i], DeathScreen.Hospitals.Blip)
end

-- Core revive function that handles the actual ped resurrection
local function DoRevive(x, y, z, w)
    DoScreenFadeOut(100)
    Wait(200)

    -- Store target coords for later enforcement
    local targetX, targetY, targetZ, targetW = x, y, z, w or 0.0

    local ped = PlayerPedId()

    -- Resurrect player first
    NetworkResurrectLocalPlayer(targetX, targetY, targetZ, targetW, true, false)
    Wait(100)

    -- Force set coordinates after resurrection
    local newPed = PlayerPedId()
    SetEntityCoordsNoOffset(newPed, targetX, targetY, targetZ, false, false, false)
    SetEntityHeading(newPed, targetW)

    -- Clear all death-related state
    ClearPedBloodDamage(newPed)
    SetEntityHealth(newPed, GetEntityMaxHealth(newPed))
    ClearPedTasksImmediately(newPed)
    SetPlayerInvincible(PlayerId(), false)
    ClearPlayerWantedLevel(PlayerId())

    -- Clear ESX ambulancejob death screen effects (greyscale filter)
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
    SetTimecycleModifier('default')
    SetTimecycleModifierStrength(1.0)
    AnimpostfxStop('DeathFailOut')
    AnimpostfxStop('DeathFailMPDark')
    AnimpostfxStop('DeathFailMPIn')
    AnimpostfxStop('PPFilter')
    AnimpostfxStop('DrugsMichaelAliensFight')
    AnimpostfxStop('DeathFailNeutralIn')
    AnimpostfxStop('MP_death_grade_blend01')
    AnimpostfxStop('FinaleCredits')
    SetCamEffect(0)

    -- Remove any lingering screen effects
    if IsScreenFadedOut() or IsScreenFadingOut() then
        DoScreenFadeIn(0)
    end

    Wait(100)
    DoScreenFadeIn(500)

    -- CRITICAL: Re-set coordinates BEFORE triggering spawn events
    -- This ensures we're at the target location first
    SetEntityCoordsNoOffset(newPed, targetX, targetY, targetZ, false, false, false)
    SetEntityHeading(newPed, targetW)

    -- Trigger ESX spawn events (this is what esx_ambulancejob listens for)
    TriggerServerEvent('esx:onPlayerSpawn')
    TriggerEvent('esx:onPlayerSpawn')
    TriggerEvent('playerSpawned')

    -- CRITICAL: Re-set coordinates AFTER spawn events to override any ambulancejob teleporting
    Wait(200)
    SetEntityCoordsNoOffset(newPed, targetX, targetY, targetZ, false, false, false)
    SetEntityHeading(newPed, targetW)

    -- Clear timecycle again after events in case ambulancejob re-applied it
    Wait(300)
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
    AnimpostfxStop('DeathFailOut')
    AnimpostfxStop('DeathFailMPDark')
    AnimpostfxStop('DeathFailMPIn')

    -- Final coordinate enforcement after all events
    SetEntityCoordsNoOffset(newPed, targetX, targetY, targetZ, false, false, false)
    SetEntityHeading(newPed, targetW)

    -- Tell esx_ambulancejob that player is no longer dead
    -- This is CRITICAL - otherwise ESX thinks they're still dead
    TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

    -- Close deathscreen UI
    Zen.Functions.NUI('closeDeathScreen', {})
    playerDead = false
    ToggleUIs(true)
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

                    if IsControlPressed(0, 45) then -- R key
                        DoRevive(cache.coords.x, cache.coords.y, cache.coords.z, cache.coords.w or 0.0)
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
            Zen.Functions.Notify('You are not near a wager zone', 'xmark', '#EC4899')
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
                Zen.Functions.Notify('You Arent Holding A Weapon', 'xmark', '#EC4899')
            end
        end
    end
end)

RegisterCommand('r', function()
    if isNearRampZone("combatheals") then
        if IsEntityDead(PlayerPedId()) then
            TriggerEvent('deathscreen:revive')
        else
            Zen.Functions.Notify('You cannot do this while alive.', 'xmark', '#EC4899')
            return end
    end
end)

RegisterCommand('a', function()
    if isNearRampZone("combatheals") then
        if IsEntityDead(PlayerPedId()) then
            Zen.Functions.Notify('You cannot do this while dead.', 'xmark', '#EC4899')
            return
        end
        if armorCooldown then
            return
        end
        if GetPedArmour(PlayerPedId()) < 100 then
            SetPedArmour(PlayerPedId(), 100)
            armorCooldown = true
            Zen.Functions.Notify('Your armour has been replenished', 'shield', '#EC4899')
            Wait(5000)
            armorCooldown = false
        end
    end
end)

RegisterCommand('h', function()
    if isNearRampZone("combatheals") then
        if IsEntityDead(PlayerPedId()) then
            Zen.Functions.Notify('You cannot do this while dead.', 'xmark', '#EC4899')
            return
        end
        if healthCooldown then
            return
        end
        if GetEntityHealth(PlayerPedId()) < 200 then
            SetEntityHealth(PlayerPedId(), 200)
            healthCooldown = true
            Zen.Functions.Notify('Your health has been replenished', 'heart', '#EC4899')
            Wait(5000)
            healthCooldown = false
        else
            Zen.Functions.Notify('Your health is already full.', 'xmark', '#EC4899')
        end
    end
end)

RegisterNUICallback('respawnTimerFinished', function(_, callback)
    CreateThread(function()
        while playerDead do
            Wait(0)

            for i = 1, #DeathScreen.Buttons do
                local button = DeathScreen.Buttons[i]
                local keyCode = KeyMappings[button.key] or 0

                if keyCode > 0 and IsControlJustPressed(0, keyCode) then
                    -- Perform respawn - server will handle money deduction
                    RespawnPlayerAt(button, true)
                    break
                end
            end
        end

        Zen.Functions.NUI('closeDeathScreen', {})
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

    local x, y, z, w = coords.x, coords.y, coords.z, coords.w or 0.0

    -- Tell server to handle money deduction and weapon giving
    TriggerServerEvent('deathscreen:performAfterDeath', data.price or 0, data.weapon)

    -- Revive the player using ESX-compatible revive
    DoRevive(x, y, z, w)

    -- Give weapon after revive if button has one
    if data.weapon then
        Wait(500)
        local weaponHash = GetHashKey(data.weapon)
        GiveWeaponToPed(PlayerPedId(), weaponHash, 250, false, true)
    end
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

    -- Always send the config buttons (E, F, G) - ramp zone R key is handled separately
    Zen.Functions.NUI('showDeathScreen', {
        reason = deathReason,
        buttons = DeathScreen.Buttons,
        respawnTimer = (DeathScreen.OnDeath.RespawnTime / 1000),
        bleedOutTimer = (DeathScreen.OnDeath.BleedoutTime / 1000)
    })
end)

-- Revive event - used by redzones, admin revive, /r command, esx_ambulancejob
RegisterNetEvent('deathscreen:revive', function(coords)
    local spawnCoords = coords or cache.coords
    local x, y, z, w

    -- Handle different coordinate formats
    if type(spawnCoords) == 'vector4' then
        x, y, z, w = spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w
    elseif type(spawnCoords) == 'vector3' then
        x, y, z, w = spawnCoords.x, spawnCoords.y, spawnCoords.z, 0.0
    elseif type(spawnCoords) == 'table' then
        x = spawnCoords.x or spawnCoords[1] or cache.coords.x
        y = spawnCoords.y or spawnCoords[2] or cache.coords.y
        z = spawnCoords.z or spawnCoords[3] or cache.coords.z
        w = spawnCoords.w or spawnCoords[4] or 0.0
    else
        x, y, z, w = cache.coords.x, cache.coords.y, cache.coords.z, 0.0
    end

    DoRevive(x, y, z, w)
end)

-- Also listen for esx_ambulancejob revive events
AddEventHandler('esx_ambulancejob:revive', function()
    DoRevive(cache.coords.x, cache.coords.y, cache.coords.z, 0.0)
end)

RegisterCommand('die', function()
    if not Zen.Functions.CanInteract() then
        return Zen.Functions.Notify('Can\'t Do This Right Now!', 'xmark', '#EC4899')
    end

    SetEntityHealth(cache.ped, 0)
    playerDead = true
end)
