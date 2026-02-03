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

stateBag = LocalPlayer.state
playerCount = {
    online = 0,
    max = Zen.Config.Server.MaxPlayers
}

-- Check if player is new (no name set)
local function CheckNewPlayer()
    local xPlayer = GetESX().GetPlayerData()
    if xPlayer and xPlayer.firstName then
        local firstName = xPlayer.firstName
        if not firstName or firstName == '' or firstName == 'Unknown' then
            return true
        end
    end
    return false
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
    UpdateTopRight()
    ToggleUIs(true)
	while true do
    	Wait(0)
    if IsPedArmed(ped, 6) then
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

RegisterNetEvent('esx:setAccountMoney', function(account)
    local value = { name = account.name, money = account.money }
    UpdateTopRight('accounts', value)
end)

RegisterNetEvent('esx:setJob', function(data)
    UpdateTopRight('job', data)
end)

RegisterNetEvent('player:count', function(data)
    playerCount.online = data
end)

