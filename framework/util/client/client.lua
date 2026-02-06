-- Initialize ESX Object
ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(100)
    end

    -- Fallback to export if event doesn't work
    if ESX == nil then
        ESX = exports['es_extended']:getSharedObject()
    end
end)

-- Helper function to safely get ESX
function GetESX()
    if ESX == nil then
        ESX = exports['es_extended']:getSharedObject()
    end
    return ESX
end

-- ============================================
-- SPAWN HANDLER - Required for newer ESX
-- ============================================
-- Since we're not using esx_identity/multicharacter,
-- we need to handle the spawn ourselves
local hasSpawned = false

AddEventHandler('esx:onPlayerLogout', function()
    hasSpawned = false
end)

-- Set up spawnmanager to spawn the player
exports.spawnmanager:setAutoSpawnCallback(function()
    if hasSpawned then return end
    hasSpawned = true

    -- Spawn at default coords (will be updated by ESX position)
    exports.spawnmanager:spawnPlayer({
        x = -269.4,
        y = -955.3,
        z = 31.2,
        heading = 0.0,
        model = 'mp_m_freemode_01',
        skipFade = false
    }, function()
        -- Notify ESX that the player has spawned
        TriggerEvent('playerSpawned')
        TriggerServerEvent('esx:onPlayerSpawn')
    end)
end)

exports.spawnmanager:setAutoSpawn(true)
exports.spawnmanager:forceRespawn()

stateBag = LocalPlayer.state
playerCount = {
    online = 0,
    max = Zen.Config.Server.MaxPlayers
}

-- Check if player is new (no name set) - uses server callback
local function CheckNewPlayer()
    local isNew = lib.callback.await('register:isNewPlayer', false)
    return isNew
end

RegisterNetEvent('showNotification', function(text, icon, color)
    Zen.Functions.Notify(text, icon, color)
end)

CreateThread(function()
    repeat
        Wait(2000)
    until NetworkIsSessionActive()

    -- Wait for ESX to be ready
    while GetESX() == nil or GetESX().GetPlayerData() == nil do
        Wait(500)
    end

    -- Wait for job to be set
    local timeout = 0
    while not stateBag.job and timeout < 60 do
        Wait(500)
        timeout = timeout + 1
    end

    -- If stateBag.job still nil, get from ESX
    if not stateBag.job then
        local playerData = GetESX().GetPlayerData()
        if playerData and playerData.job then
            stateBag:set('job', playerData.job, true)
        end
    end

    TriggerServerEvent('playerLoaded', cache.serverId)
    TriggerServerEvent('gangs:playerLoaded')
    TriggerEvent('playerLoaded')

    -- Check if new player needs to register
    Wait(2000)
    if CheckNewPlayer() then
        TriggerEvent('register:open')
    end

    NetworkSetTalkerProximity(12.0)
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    SetAudioFlag("LoadMPData", true)
    SetAudioFlag("DisableFlightMusic", true)
    SetAudioFlag("WantedMusicDisabled", true)
    SetAudioFlag("PoliceScannerDisabled", true)
    SetAudioFlag("OnlyAllowScriptTriggerPoliceScanner", true)
    SetAudioFlag("AllowPoliceScannerWhenPlayerHasNoControl", false)

    SetCanAttackFriendly(cache.ped, true, false)
	NetworkSetFriendlyFireOption(true)
    ClearPlayerWantedLevel(cache.playerId)
	SetMaxWantedLevel(0)

    SetPlayerTargetingMode(2)
    SetWind(0)

    N_0x4757f00bc6323cfe(-1553120962, 0.0) 

    StatSetInt('MP0_SHOOTING_ABILITY', 120, true)
    StatSetInt('MP0_STAMINA', 100, true)
    StatSetInt('MP0_LUNG_CAPACITY', 100, true)
    StatSetInt('MP0_STEALTH_ABILITY', 100, true)

    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) 
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) 
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) 
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)
    SetRadarZoom(1100)
    ToggleUIs(true)

    -- Fetch real account data from server (authoritative) for initial HUD
    Wait(2000)
    local serverAccounts = lib.callback.await('hud:getAccounts', false)
    if serverAccounts then
        local data = {}
        data.money = Zen.Functions.FormatCommas(serverAccounts.money or 0)
        data.bank = Zen.Functions.FormatCommas(serverAccounts.bank or 0)
        data.dirty = Zen.Functions.FormatCommas(serverAccounts.black_money or 0)
        SendNUIMessage({ action = 'UpdateMoneyHud', data = data })
    end

    -- Also do a full refresh for job/gang data
    UpdateTopRight()

	while true do
    	Wait(0)
    if IsPedArmed(cache.ped, 6) then
        DisableControlAction(1, 140, true)
        DisableControlAction(1, 141, true)
        DisableControlAction(1, 142, true)
    else
        Wait(1500)
    end
    end
end)

ToggleUIs = function(bool)
    if bool == true then 
        Zen.Functions.NUI('showHuds', {})
        if insideGreenzone then 
            Zen.Functions.NUI('enterGreenzone', {})
        end
    else 
        Zen.Functions.NUI('hideHuds', {})
        Zen.Functions.NUI('exitGreenzone', {})
    end
end

UpdateTopRight = function(type, value)
    local data = {}
    local esx = GetESX()
    local ply = esx and esx.GetPlayerData() or nil

    if type == 'gang' or not type then
        local gang = (value and value.label or stateBag.gang)
        local rank = (value and value.rank_label or stateBag.gang_rank)

        if gang == nil or gang == '' then
            data.gang = ''
        else
            data.gang = gang
            data.gangRank = rank or ''
        end
    end

    if type == 'job' or not type then
        local jobData = stateBag.job or (ply and ply.job)
        if jobData then
            data.job = (value and value.label or jobData.label or 'Unemployed')
            data.jobRank = (value and value.grade_label or jobData.grade_label or '')

            local jobName = (value and value.name or jobData.name)
            local jobGrade = tostring((value and value.grade or jobData.grade or 0))

            if Zen.Jobs[jobName] and Zen.Jobs[jobName].grades[jobGrade] then
                if Zen.Jobs[jobName].grades[jobGrade].name == 'unemployed' then
                    data.job = (value and value.label or jobData.label or 'Unemployed')
                end
            end
        else
            data.job = 'Unemployed'
            data.jobRank = ''
        end
    end

    if type == 'accounts' or not type then
        if value then
            data[value.name] = Zen.Functions.FormatCommas(tonumber(value.money))
        elseif ply and ply.accounts then
            local accounts = ply.accounts
            for i = 1, #accounts do
                if accounts[i].name == 'bank' then
                    data.bank = Zen.Functions.FormatCommas(accounts[i].money)
                elseif accounts[i].name == 'money' then
                    data.money = Zen.Functions.FormatCommas(accounts[i].money)
                elseif accounts[i].name == 'black_money' then
                    data.dirty = Zen.Functions.FormatCommas(accounts[i].money)
                end
            end
        else
            data.bank = '0'
            data.money = '0'
            data.dirty = '0'
        end
    end

    SendNUIMessage({
        action = 'UpdateMoneyHud',
        data = data
    })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
                if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
        end
    end
end)

-- ESX fires this when player is fully loaded with all data
RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    -- Full refresh of HUD with fresh ESX data from server
    Wait(1000)
    local serverAccounts = lib.callback.await('hud:getAccounts', false)
    if serverAccounts then
        local data = {}
        data.money = Zen.Functions.FormatCommas(serverAccounts.money or 0)
        data.bank = Zen.Functions.FormatCommas(serverAccounts.bank or 0)
        data.dirty = Zen.Functions.FormatCommas(serverAccounts.black_money or 0)
        SendNUIMessage({ action = 'UpdateMoneyHud', data = data })
    end
    UpdateTopRight()
    ToggleUIs(true)
end)

RegisterNetEvent('esx:setAccountMoney', function(account)
    local value = { name = account.name, money = account.money }
    UpdateTopRight('accounts', value)
end)

-- ESX fires this event when cash (money) changes
RegisterNetEvent('esx:setMoney', function(money)
    local value = { name = 'money', money = money }
    UpdateTopRight('accounts', value)
end)

RegisterNetEvent('esx:setJob', function(data)
    UpdateTopRight('job', data)
end)

-- Gang update from server
RegisterNetEvent('gangs:set', function(gangData)
    if gangData then
        UpdateTopRight('gang', gangData)
    else
        UpdateTopRight('gang', { label = '', rank_label = '' })
    end
end)

RegisterNetEvent('player:count', function(data)
    playerCount.online = data
end)

-- ============================================
-- Weapon and ammo info for HUD
-- ============================================
CreateThread(function()
    local lastWeapon = nil
    local lastAmmo = -1

    while true do
        Wait(200)
        local ped = PlayerPedId()
        local _, currentWeapon = GetCurrentPedWeapon(ped, true)

        if currentWeapon and currentWeapon ~= `WEAPON_UNARMED` then
            local ammoCount = GetAmmoInPedWeapon(ped, currentWeapon)
            local clipSize = GetMaxAmmoInClip(ped, currentWeapon, true)
            local _, ammoInClip = GetAmmoInClip(ped, currentWeapon)

            if currentWeapon ~= lastWeapon or ammoCount ~= lastAmmo then
                lastWeapon = currentWeapon
                lastAmmo = ammoCount

                -- Get weapon name from hash
                local weaponName = Zen.Weapons and Zen.Weapons[Zen.HashKey and Zen.HashKey[currentWeapon]] or 'Weapon'

                SendNUIMessage({
                    action = 'UpdateWeaponHud',
                    data = {
                        show = true,
                        weapon = weaponName,
                        ammo = ammoInClip .. ' / ' .. ammoCount
                    }
                })
            end
        else
            if lastWeapon ~= nil then
                lastWeapon = nil
                lastAmmo = -1
                SendNUIMessage({
                    action = 'UpdateWeaponHud',
                    data = { show = false }
                })
            end
        end
    end
end)

-- ============================================
-- Disable weapon wheel globally
-- ============================================
-- Player must use inventory system instead of weapon wheel
CreateThread(function()
    while true do
        Wait(0)
        -- Disable weapon wheel (TAB / L1 on controller)
        BlockWeaponWheelThisFrame()
        -- Disable weapon selection keys
        DisableControlAction(0, 37, true)  -- INPUT_SELECT_WEAPON (TAB)
        DisableControlAction(0, 157, true) -- INPUT_SELECT_WEAPON_UNARMED
        DisableControlAction(0, 158, true) -- INPUT_SELECT_WEAPON_MELEE
        DisableControlAction(0, 159, true) -- INPUT_SELECT_WEAPON_HANDGUN
        DisableControlAction(0, 160, true) -- INPUT_SELECT_WEAPON_SMG
        DisableControlAction(0, 161, true) -- INPUT_SELECT_WEAPON_AUTO_RIFLE
        DisableControlAction(0, 162, true) -- INPUT_SELECT_WEAPON_SHOTGUN
        DisableControlAction(0, 163, true) -- INPUT_SELECT_WEAPON_SNIPER
        DisableControlAction(0, 164, true) -- INPUT_SELECT_WEAPON_HEAVY
        DisableControlAction(0, 165, true) -- INPUT_SELECT_WEAPON_SPECIAL
    end
end)

-- ============================================
-- Disable ESX 1.1.0 built-in HUD money display
-- ============================================
-- ESX 1.1.0 draws money with DrawText natives in a loop.
-- We hide the HUD cash component by overriding ESX.UI.HUD if available,
-- and also hide the specific GTA HUD components ESX uses.
CreateThread(function()
    -- Wait for ESX to be ready
    while not ESX do Wait(500) end

    -- Try to disable ESX HUD through its API
    if ESX.UI and ESX.UI.HUD then
        if ESX.UI.HUD.SetDisplay then
            ESX.UI.HUD.SetDisplay(0.0)
        end
        ESX.UI.HUD.IsVisible = false
    end

    -- Continuously hide GTA HUD cash component (component 3 = CASH, 4 = BANK)
    -- This overrides ESX's native text drawing for money
    while true do
        HideHudComponentThisFrame(3)  -- CASH
        HideHudComponentThisFrame(4)  -- MP_CASH
        Wait(0)
    end
end)

-- ============================================
-- Override esx_ambulancejob death screen
-- ============================================
-- Aggressively disable esx_ambulancejob's death handling.
-- We set ESX.PlayerData.dead = false so ambulancejob thinks the player is alive,
-- while our own deathscreen uses the 'playerDead' variable instead.

-- Override ambulancejob death events
AddEventHandler('esx_ambulancejob:onPlayerDeath', function()
    return
end)

-- When our framework detects death, tell ESX the player is NOT dead
-- This prevents ambulancejob from running its death loop/timer
AddEventHandler('esx:onPlayerDeath', function()
    Wait(100)
    -- Override ESX's death state so ambulancejob doesn't show its screen
    local esx = GetESX()
    if esx then
        local playerData = esx.GetPlayerData()
        if playerData then
            playerData.dead = false
        end
    end
end)

-- Continuously suppress ambulancejob effects and override its death state
CreateThread(function()
    while true do
        if playerDead then
            -- Override ESX dead state to prevent ambulancejob from showing its UI
            local esx = GetESX()
            if esx then
                local playerData = esx.GetPlayerData()
                if playerData then
                    playerData.dead = false
                end
            end

            -- Clear all death screen effects ambulancejob may apply
            ClearTimecycleModifier()
            ClearExtraTimecycleModifier()
            AnimpostfxStop('DeathFailOut')
            AnimpostfxStop('DeathFailMPDark')
            AnimpostfxStop('DeathFailMPIn')
            AnimpostfxStop('DeathFailNeutralIn')
            AnimpostfxStop('MP_death_grade_blend01')

            -- Clear help text that ambulancejob shows ("Do /911...")
            ClearAllHelpMessages()

            Wait(100)
        else
            Wait(1000)
        end
    end
end)

