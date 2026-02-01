local Redzone = Zen.Config.Redzones
local kills, headshots, reward = 0, 0, 0
local closestZone = nil
local plyZone = false

local function perform(action, zone)
    local zoneData = Redzone.Zones[zone]

    if not zoneData then return end

    TriggerServerEvent('redzones:action', action, zone)

    kills = 0 headshots = 0

    if action == 'enter' then
        reward = zoneData.reward

        SendNUIMessage({
            action = 'showRedzoneUI',
            location = zoneData.label
        })

        SendNUIMessage({
            action = 'updateRedzoneUI',
            kills = kills,
            reward = reward        
        })

        if cache.vehicle and Redzone.OnEnter['Delete Vehicle'] then 
            DeleteVehicle(cache.vehicle, false)
        end

        if Redzone.OnEnter['Toggle Money/Map'] then 
            Zen.Functions.NUI('hideMoneyUI', {})
            DisplayRadar(false)
        end
    else
        closestZone = nil
        Zen.Functions.NUI('hideRedzoneUI', {})

        if Redzone.OnEnter['Toggle Money/Map'] then 
            Zen.Functions.NUI('showMoneyUI', {})
            DisplayRadar(true)
        end
    end
end

for i = 1, #Redzone.Zones do 
    local zone = Redzone.Zones[i]

    local point = lib.points.new(zone.coords, zone.radius * 2, { id = i, radius = zone.radius, coords = zone.coords })

    function point:onExit()
        perform('exit', self.id)
    end

    function point:nearby()
        local zoneData = Redzone.Zones[self.id]
        closestZone = self.id

        DrawMarker(28, self.coords.x, self.coords.y, self.coords.z - 5.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, self.radius + 1.0, self.radius + 1.0, 50.0, 255, 0, 0, 125, false, false, 0, false)
         
        if self.currentDistance <= self.radius then
            BlockWeaponWheelThisFrame()
            DisableControlAction(0, 37, true)
            DisableControlAction(0, 199, true)
            
            if not plyZone then 
                plyZone = true
                perform('enter', self.id)
            end
        elseif plyZone and (self.currentDistance > self.radius) then
            plyZone = false
            perform('exit', self.id)
        end
    end

    Zen.Functions.CreateBlip(zone.coords, {
        Name = '~HUD_COLOUR_REDLIGHT~Redzone | ~w~'..zone.label, 
        Type = 432, 
        Color = 1
    })

    Zen.Functions.CreateRadiusBlip(zone.coords, {
        Type = 373,
        Color = 1,
        Alpha = 155,
        Radius = (zone.radius + tonumber(zone.radius * 7.4))
    }) 
end

RegisterNetEvent('redzones:kills', function(_kills, _headshot)
    if _headshot then headshots += 1 end
    kills = _kills

    SendNUIMessage({
        action = 'updateRedzoneUI',
        kills = kills,
        reward = ((kills + 1) * reward)    
    })
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    if closestZone ~= nil and plyZone == true then
        local currentZone = Redzone.Zones[closestZone]

        local killer = (data.killedByPlayer and data.killerServerId) or -1
        local headshot = false

        if killer and killer ~= -1 then 
            local bulletHit, boneHit = GetPedLastDamageBone(cache.ped)
            if bulletHit then
                if (boneHit == 31086) then
				    headshot = true
			   end
            end

            TriggerServerEvent('redzones:killed', killer, currentZone.reward, currentZone.label, headshot) 
        end

        local spawn = math.random(#currentZone.revives)
        SetTimeout(600, function()
            TriggerEvent('deathscreen:revive', currentZone.revives[spawn])
        end)
    end
end)

RegisterNetEvent('redzones:give:weapon', function(action, weapon)
    if action == 'exit' then
        RemoveWeaponFromPed(cache.ped, GetHashKey(weapon))
    elseif action == 'enter' then
        GiveWeaponToPed(cache.ped, weapon, 25000, false, true)
    end
end)