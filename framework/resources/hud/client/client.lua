local sleeptime = 400

CreateThread(function()
    while true do
        local ped = cache.ped
        local health = GetEntityHealth(ped) - 100
        local armour = GetPedArmour(ped)
        local talking = NetworkIsPlayerTalking(PlayerId())
        local paused = IsPauseMenuActive()
        local id = cache.serverId

        SendNUIMessage({
            action = 'updateHud', 
            health = health,
            armour = armour,
            talking = talking,
            paused = paused,
            id = id
        })
        Citizen.Wait(sleeptime)
    end
end)

lib.onCache('vehicle', function(vehicle)
    SetPlayerCanDoDriveBy(cache.playerId, false)
    if vehicle and vehicle ~= false then

        if GetPedInVehicleSeat(vehicle, -1) == cache.ped then
            SetPlayerCanDoDriveBy(cache.playerId, false)
        else
            SetPlayerCanDoDriveBy(cache.playerId, true)
        end

        if vehicle and GetPedInVehicleSeat(vehicle, cache.seat) == cache.ped then
            SetPedIntoVehicle(cache.ped, vehicle, cache.seat)
        end

        CreateThread(function()
            while cache.vehicle and cache.vehicle ~= false do
                vehicle = cache.vehicle

                local vel = math.ceil(GetEntitySpeed(vehicle) * 1.5369)
                --local health = math.floor(GetVehicleEngineHealth(vehicle)) / 10
                --local playerPos = GetEntityCoords(cache.ped)

                SendNUIMessage({
                    action = 'updateCarHud', 
                    speed = vel,
                    engine = true,
                })
                -- GetStreetNameFromHashKey(GetStreetNameAtCoord(playerPos.x, playerPos.y, playerPos.z))
                Wait(100)
            end
            
            
            SendNUIMessage({
                action = 'updateCarHud', 
                engine = false
            })
        end)
    end
end) 