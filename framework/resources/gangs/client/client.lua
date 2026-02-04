local Turf = Zen.Config.Gang.Turfs
local gangs = Zen.Config.Gang.Gangs or {}
local turfs = Turf.Zones or {}
local turfKills = {}

local closestTurf = nil
local plyZone = false
local civZone = false
local pressedTurf = false

local timers = {}
local points = {}
local blips = {}

local function openGradesMenu(gangData, memberData)
    local ranks = {}

    for key, rank in next, gangData.ranks do
        ranks[#ranks+1] = {
            rank = key,
            value = key,
            label = rank.label
        }
    end

    table.sort(ranks, function(a, b) return a.rank > b.rank end)

    local newGrade = lib.inputDialog('Promote/Demote Member', {
        { type = 'select', label = 'Gang Ranks', options = ranks }
    })

    if not newGrade or not newGrade[1] then
        return
    end

    if gangData.members[memberData.identifier].rank == tonumber(newGrade[1]) then
        return Zen.Functions.Notify('Member Is Already '..gangData.ranks[tonumber(newGrade[1])].label)
    end

    if memberData.rank >= tonumber(stateBag.gang_rank) then
        return Zen.Functions.Notify('Member Is Higher Then You!', 'user', '#EC4899')
    end

    TriggerServerEvent('gangs:changeGrade', tonumber(newGrade[1]), memberData.identifier, memberData.name)
end

local function openMemberMenu(gangData, memberData)
    lib.hideMenu(true)
    lib.registerMenu({
        id = 'management_member_menu',
        title = ('Managing %s'):format(memberData.name),
        position = 'bottom-right',
        options = {
            { label = 'Kick Member', icon = 'xmark' },
            { label = 'Promote/Demote Member', icon = 'ranking-star' }
        }
    }, function(selected)
        if selected == 1 then 
            if memberData.rank >= tonumber(stateBag.gang_rank) then
                return Zen.Functions.Notify('This Member is Higher Then You!')
            end

            lib.hideMenu(true)
            Wait(100)

            local alert = lib.alertDialog({
                header = ('Kicking %s'):format(memberData.name),
                centered = true,
                cancel = true
            })
             
            if alert ~= 'confirm' then return end

            TriggerServerEvent('gangs:kick', memberData.identifier, memberData.name)
        elseif selected == 2 then 
            openGradesMenu(gangData, memberData)
        end
    end)

    lib.showMenu('management_member_menu')
end

local function openMembersMenu(gangData)

    local members = {}
    local gangMembers = lib.callback.await('gangs:get:members', false, stateBag.gang)

    for _, member in next, gangMembers do
        local icon = 'person'

        if member.leader then
            icon = 'star'
        end

        members[#members+1] = {
            label = ('%s - %s'):format(member.name, gangData.ranks[member.rank].label),
            identifier = member.identifier,
            rank = member.rank,
            leader = member.leader,
            name = member.name,
            icon = icon
        }
    end

    lib.hideMenu(true)
    lib.registerMenu({
        id = 'management_members_menu',
        title = ('%s Members'):format(gangData.name),
        position = 'bottom-right',
        options = members,
        onClose = function()
            lib.showMenu('management_menu')
        end,
    }, function(selected)
        local memberData = members[selected]

        if not memberData then return end

        if stateBag.identifier == memberData.identifier then 
            return Zen.Functions.Notify('You Can\'t Interact With Yourself!') 
        end

        openMemberMenu(gangData, memberData)
    end)

    lib.showMenu('management_members_menu')
end

local function openInviteMenu(gang)
    lib.hideMenu(true)

    local invitePlayer = lib.inputDialog('Invite Player To Gang', {
        { type = 'number', label = 'Player ID' }
    })

    if not invitePlayer then return end

    TriggerServerEvent('gangs:addNewMember', invitePlayer[1])
end


RegisterNetEvent('turfs:kickOut')
AddEventHandler('turfs:kickOut', function(turfId)
    local turfData = turfs[turfId]
    if turfData and turfData.coords then
        SetEntityCoords(cache.ped, turfData.coords.x, turfData.coords.y - (turfData.radius + 5), turfData.coords.z)
        Zen.Functions.Notify('You have been kicked out of the turf due to strikes!', 'xmark', '#EC4899')
    end
end)

RegisterNetEvent('turfs:notify')
AddEventHandler('turfs:notify', function(msg, icon, color)
    Zen.Functions.Notify(msg, icon, color)
end)

local function openManagementMenu(gangData)
    lib.registerMenu({
        id = 'management_menu',
        title = ('Managing %s'):format(gangData.name),
        position = 'bottom-right',
        options = {
            {label = 'Manage Storage', icon = 'box'},
            {label = 'Manage Members', icon = 'users'},
            {label = 'Invite Player', icon = 'add'},
        }
    }, function(selected)
        if selected == 1 then 
            TriggerEvent('gangs:storage:open', stateBag.gang)
        elseif selected == 2 then 
            openMembersMenu(gangData)
        elseif selected == 3 then 
            openInviteMenu(stateBag.gang)
        end
    end)

    lib.showMenu('management_menu')
end

local function openVehiclesMenu(gangData)
    local vehicles = {}

    local spawner = gangData.spawner

    for _, vehicle in next, spawner.vehicles do
        vehicles[#vehicles+1] = {
            label = vehicle.label,
            model = joaat(vehicle.model),
            leader = vehicle.leader,
            color = gangData.color,
            plate = 'GANG',
            icon = 'car-side'
        }
    end

    lib.registerMenu({
        id = 'vehicles_menu',
        title = ('%s Vehicles'):format(gangData.name),
        position = 'bottom-right',
        options = vehicles
    }, function(selected)
        local value = vehicles[selected]
        local spawn = spawner.spawn

        if not value then return end

        if value.leader and not gangData.ranks[tonumber(stateBag.gang_rank)].leader then
            return Zen.Functions.Notify('You Can\'t Spawn This Vehicle!')
        end

        if not cache.vehicle then 
            Zen.Streaming.SpawnVehicle(value.model, vec3(spawn.x, spawn.y, spawn.z), spawn.w, function(callback)
                TaskWarpPedIntoVehicle(cache.ped, callback, -1)
               
                if value?.color then
                    SetVehicleCustomPrimaryColour(callback, value.color[1], value.color[2], value.color[3])
                    SetVehicleCustomSecondaryColour(callback, value.color[1], value.color[2], value.color[3])
                end
    
                SetVehicleNumberPlateText(callback, value.plate)
            end, true, cache.serverId)
        else
            Zen.Functions.Notify('You Are Already In A Vehicle', 'car', '#EC4899')
        end
    end)

    if #vehicles > 0 then
        lib.showMenu('vehicles_menu')
    end
end

local function updatePlayerGangData()
    local pointWiped = promise.new()
    local blipsWiped = promise.new()

    TriggerEvent('chat:addSuggestion', '/setgang', 'Set A Players Gang', { { name = 'playerId', help = 'Player ID' }, { name = 'name', help = 'Gang Name' }, { name = 'rank', help = 'Gang Grade' } })

    if table.type(points) ~= 'empty' then
        for _, value in next, points do
            value:remove()
        end

        table.wipe(points)
        pointWiped:resolve()
    else
        pointWiped:resolve()
    end

    if table.type(blips) ~= 'empty' then
        for _, value in next, blips do
            RemoveBlip(value)
        end

        table.wipe(blips)
        blipsWiped:resolve()
    else
        blipsWiped:resolve()
    end

    local gang, rank = stateBag.gang, stateBag.gang_rank
    local gangData = gangs[gang]

    if not gangData then return end

    Citizen.Await(pointWiped)
    Citizen.Await(blipsWiped)

    local spawner = gangData.spawner

    local point = lib.points.new(spawner.coords, spawner.radius * 3)
    points[#points+1] = point

    function point:onExit()
        lib.hideMenu(true)
    end

    function point:nearby()
        Zen.Functions.FloatText(spawner.coords, '[E] - ~r~Gang~w~ Vehicles')

        if self.currentDistance <= spawner.radius then
            if IsControlJustPressed(0, 38) then
                openVehiclesMenu(gangData)
            end
        end
    end

    for key, value in next, turfs do
        local blip = Zen.Functions.CreateBlip(value.coords, {
            Type = 437,
            Color = 49,
            Name = ('~HUD_COLOUR_RED~Turf War~w~ | %s'):format(value.name),
        })

        blips[#blips+1] = blip
    end
end

RegisterNetEvent('gangs:set', function(gangData)
    local data = {}

    if not gangData or table.type(gangData) == 'empty' then
        data.label = ''
        data.rank_label = ''
    else 
        data.label = gangData.label
        data.rank_label = gangData.rank_label
    end

    updatePlayerGangData()
    UpdateTopRight('gang', data)
end)

AddEventHandler('gameEventTriggered', function(event, params)
    if event ~= 'CEventNetworkEntityDamage' then return end
    local victim, attacker = params[1], params[2]

    if DoesEntityExist(victim) and DoesEntityExist(attacker) then
        if not IsPedAPlayer(victim) or not IsPedAPlayer(attacker) then return end

        local victimIndex, attackerIndex = NetworkGetPlayerIndexFromPed(victim), NetworkGetPlayerIndexFromPed(attacker)
        local victimId, attackerId = GetPlayerServerId(victimIndex), GetPlayerServerId(attackerIndex)

        if IsEntityDead(victim) or IsPedFatallyInjured(victim) then
            if Player(victimId).state.gang == Player(attackerId).state.gang then return end
            TriggerServerEvent('gangs:killed', victimId, attackerId)
        end
    end
end)

local fixedRadius = 100.0      -- uniform radius size
local whiteColor = 0           -- white color ID

for k, v in next, gangs do
    if v.block.enabled then
        Zen.Functions.CreateBlip(v.block.coords, {
            Color = whiteColor,                                -- white icon blip
            Type = v.block.type,
            Name = '~HUD_COLOUR_RADAR_DAMAGE~Block | ~w~'..v.name
        })

        local blipRadius = AddBlipForRadius(v.block.coords.x, v.block.coords.y, v.block.coords.z, fixedRadius)
        SetBlipHighDetail(blipRadius, true)
        SetBlipColour(blipRadius, whiteColor)                  -- white radius blip
        SetBlipAlpha(blipRadius, 100)
    end
end

RegisterCommand('gang', function()
    if not stateBag.gang or stateBag.gang == '' or stateBag.gang == 'none' then
        return Zen.Functions.Notify('You are not in a gang!', 'users', '#EC4899')
    end

    local gangData = gangs[stateBag.gang]

    if not gangData then
        return Zen.Functions.Notify('Gang data not found!', 'xmark', '#EC4899')
    end

    local rank = tonumber(stateBag.gang_rank) or 0
    if not gangData.ranks[rank] or not gangData.ranks[rank].leader then
        return Zen.Functions.Notify('Only gang leaders can manage the gang!', 'xmark', '#EC4899')
    end

    openManagementMenu(gangData)
end)

RegisterNetEvent('gangs:loadedPlayer', updatePlayerGangData)

local function capture(turfId)
    local turfData = turfs[turfId]

    if not turfData then
        return
    end

    if turfData.captured then
        return Zen.Functions.Notify('This turf has already been captured!', 'skull', '#FF000')
    end

    TriggerServerEvent('turfs:start', turfId)
end

local function perform(action, turfId)
    local turfData = turfs[turfId]

    if not turfData then
        return
    end

    TriggerServerEvent('turfs:action', action, turfId)

    if action == 'enter' then
        SendNUIMessage({
            action = 'showTurfUI',
            location = turfData.name,
        })
    else
        closestTurf = nil
        Zen.Functions.NUI('hideTurfUI', { })
    end
end

RegisterNetEvent('turfs:started', function(turfId)
    if closestTurf ~= turfId then return end
    if IsEntityDead(cache.ped) or IsPedFatallyInjured(cache.ped) then return end

    local turfDarrrta = turfs[turfId]

    if not turfData then return end

    local distance = #(GetEntityCoords(cache.ped) - turfData.coords)
    if distance <= turfData.radius then
        perform('enter', turfId)
    end
end)

RegisterNetEvent('turfs:end', function(turfId)
    if closestTurf ~= turfId then return end

    Zen.Functions.NUI('hideTurfUI', {})

    if Turf.OnEnter['Toggle Map'] then 
        DisplayRadar(true)
    end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
    if plyZone == false then return end

    local turf = turfs[closestTurf]

    SetEntityCoords(cache.ped, turf.coords.x, turf.coords.y - (turf.radius + 5), turf.coords.z)
end)

local function getActivedTurfs()
    local options = {
        [1] = { icon = 'circle-info', label = 'List of all turfs' }
    }

    local activeTurfs = {}
    local startingTurfs = {}
    local inactiveTurfs = {}
    local priorityTurfs = {}
    local priorityIds = Zen.Config.Gang.PriorityTurfs or {}

    for key, value in next, turfs do
        if value.coords and value.altcoords then
            local option = {
                label = value.name,
                icon = 'skull-crossbones',
                args = {
                    coords = (value.started or value.initiated) and value.altcoords or value.coords,
                    radius = value.radius
                }
            }
            if value.started and timers[key] then
                option.label = ('%s - %s'):format(value.name, Zen.Functions.FormatSeconds(timers[key]))
                activeTurfs[#activeTurfs + 1] = option
            elseif value.initiated then
                option.label = ('%s - Starting'):format(value.name)
                startingTurfs[#startingTurfs + 1] = option
            else
                local isPriority = false
                for i, id in ipairs(priorityIds) do
                    if id == key then
                        option.label = ('%s - Inactive'):format(value.name)
                        priorityTurfs[#priorityTurfs + 1] = { option = option, key = key, order = i }
                        isPriority = true
                        break
                    end
                end
                if not isPriority then
                    option.label = ('%s - Inactive'):format(value.name)
                    inactiveTurfs[#inactiveTurfs + 1] = option
                end
            end
        end
    end

    table.sort(activeTurfs, function(a, b) return a.label < b.label end)
    table.sort(startingTurfs, function(a, b) return a.label < b.label end)
    table.sort(inactiveTurfs, function(a, b) return a.label < b.label end)
    table.sort(priorityTurfs, function(a, b) return a.order < b.order end)

    for _, option in ipairs(activeTurfs) do
        options[#options + 1] = option
    end
    for _, option in ipairs(startingTurfs) do
        options[#options + 1] = option
    end
    for _, entry in ipairs(priorityTurfs) do
        options[#options + 1] = entry.option
    end
    for _, option in ipairs(inactiveTurfs) do
        options[#options + 1] = option
    end

    return options
end

RegisterNetEvent('turfs:update', function(value)
    timers = value

    if lib.getOpenMenu() == 'active_turfs' then
        lib.setMenuOptions('active_turfs', getActivedTurfs())
    end
end)

RegisterNetEvent('turfs:change', function(value)
    turfs = value

    if lib.getOpenMenu() == 'active_turfs' then
        lib.setMenuOptions('active_turfs', getActivedTurfs())
    end
end)

RegisterNetEvent('turfs:active', function()
    lib.hideMenu()
    Wait(50)

    local options = getActivedTurfs()
    lib.registerMenu({
        id = 'active_turfs',
        title = 'Active Turfs',
        position = 'top-right',
        options = options
    }, function(selected, _, _)
        local option = options[selected]
        if not option or not option.args or not option.args.coords or not option.args.coords.x or not option.args.coords.y or not option.args.coords.z then
            Zen.Functions.Notify('Invalid turf selection or coordinates!', 'xmark', '#EC4899')
            return
        end

        SetEntityCoords(cache.ped, option.args.coords.x, option.args.coords.y, option.args.coords.z, true, false, false, false)
    end)

    lib.showMenu('active_turfs')
end)

RegisterNetEvent('teleportPlayerToTurf')
AddEventHandler('teleportPlayerToTurf', function(x, y, z)
    local playerPed = GetPlayerPed(-1)
    SetEntityCoords(playerPed, x, y, z)
end)

RegisterNetEvent('playerLoaded', function()
    while table.type(turfs) == 'empty' do
        Wait(500)
    end

    for key, value in next, turfs do
        local point = lib.points.new({
            turfId = key,
            markerRadius = value.radius,
            coords = value.coords,
            distance = value.radius * 5
        })

        function point:onExit()
            perform('exit', self.turfId)
        end

function point:nearby()
    local turfData = turfs[self.turfId]
    closestTurf = self.turfId

    if not turfData.initiated then
        if turfData.started and timers[self.turfId] then
            DrawMarker(28, self.coords.x, self.coords.y, self.coords.z - 5.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, self.markerRadius, self.markerRadius, 50.0, 255, 0, 0, 100, false, false, 0, false)

            if stateBag.gang then
                local killsTable = closestTurf ~= nil and (turfKills[closestTurf] or {})

                SendNUIMessage({
                    action = 'updateTurfUI',
                    timer = timers[self.turfId],
                    kills = killsTable[tonumber(k)] or 'none'
                })

                if self.currentDistance <= self.markerRadius and not plyZone then
                    if timers[self.turfId] <= Turf.Timers['Ending'] then
                        SetEntityCoords(cache.ped, turfData.altcoords.x, turfData.altcoords.y, turfData.altcoords.z)
                        if not self.notified then
                            Zen.Functions.Notify('Turf is ending! You cannot enter now!', 'xmark', '#EC4899')
                            self.notified = true
                        end
                        return
                    end

                    if cache.vehicle and Turf.OnEnter['Delete Vehicle'] then
                        DeleteVehicle(cache.vehicle, false)
                    end

                    if Turf.OnEnter['Toggle Map'] then
                        DisplayRadar(false)
                    end

                    plyZone = true
                    perform('enter', self.turfId)
                    self.notified = false
                end
                if plyZone and not self.restrictedCheckThread then
                    self.restrictedCheckThread = true
                    Citizen.CreateThread(function()
                        while plyZone do
                            local restrictedWeapons = {
                                'weapon_fgfswitch', 'WEAPON_FGFSWITCH',
                                'weapon_topgunnersar', 'WEAPON_TOPGUNNERSAR',
                                'weapon_tjaysr-47', 'WEAPON_TJAYSR-47'
                            }
                            local ped = cache.ped
                            local currentWeapon = GetSelectedPedWeapon(ped)
                            local hasRestricted = false
                            for _, weapon in ipairs(restrictedWeapons) do
                                if currentWeapon == GetHashKey(weapon) then
                                    hasRestricted = true
                                    break
                                end
                            end
                            if hasRestricted then
                                local apPistolHash = GetHashKey('WEAPON_APPISTOL')
                                if HasPedGotWeapon(ped, apPistolHash, false) then
                                    SetCurrentPedWeapon(ped, apPistolHash, true)
                                    Zen.Functions.Notify('Restricted weapon swapped for AP Pistol!', 'gun', '#FF9900')
                                else
                                    SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
                                    Zen.Functions.Notify('Restricted weapon swapped for fists!', 'hand-fist', '#FF9900')
                                end
                            end
                            Citizen.Wait(200)
                        end
                        self.restrictedCheckThread = nil
                    end)
                elseif plyZone and self.currentDistance > self.markerRadius then
                    if Turf.OnEnter['Toggle Map'] then
                        DisplayRadar(true)
                    end

                    plyZone = false
                    perform('exit', self.turfId)
                    self.notified = false
                    self.restrictedCheckThread = nil
                end
            else
                if self.currentDistance <= self.markerRadius and not civZone then
                    if cache.vehicle and Turf.OnEnter['Delete Vehicle'] then
                        DeleteVehicle(cache.vehicle, false)
                    end

                    if Turf.OnEnter['Need Gang'] then
                        SetEntityCoords(cache.ped, self.coords.x, self.coords.y - (self.markerRadius + 5), self.coords.z)
                        if not self.notified then
                            Zen.Functions.Notify('You Must Be In A Gang!', 'xmark', '#EC4899')
                            self.notified = true
                        end
                    end

                    civZone = true
                elseif civZone and self.currentDistance > self.markerRadius then
                    civZone = false
                    self.notified = false
                end
            end
        else
            if self.currentDistance < 15.0 then
                if self.currentDistance < 3.0 and stateBag.gang then
                    Zen.Functions.FloatText(self.coords, 'Press [E] to Capture ~r~Turf~w~')

                    if self.currentDistance < 1.5 and IsControlJustPressed(0, 38) and not pressedTurf then
                        pressedTurf = true
                        capture(self.turfId)
                        SetTimeout(1000, function()
                            pressedTurf = false
                        end)
                    end
                end
            end
        end
    end
end
    end
end)