local function toggleRegister(toggle, skin)
    SetNuiFocus(toggle, toggle)
    SendNUIMessage({
        action = 'setVisible',
        toggle = toggle
    })

    ToggleUIs(false)
    if not toggle and skin ~= true then 
        SetTimeout(500, function()
            TriggerEvent('esx_skin:openSaveableMenu', cache.serverId)
            return
            ToggleUIs(true)
        end)
    end
    SetNuiFocus(toggle, toggle)

    Wait(1000)
    SetNuiFocus(toggle, toggle)
    return true
end

local function confirmRegister(data)
    if not data then return notify('Please fill out the register menu') end 

    local firstName, lastName, dob, gender = data.firstName, data.lastName, data.birthday, data.gender
    if not firstName or string.len(firstName) < 3 then 
		return Zen.Functions.Notify('Please make sure you have filled out a first name and make sure it is over 3 characters', '#EC4899')
    end
    if not lastName or string.len(lastName) < 3 then 
		return Zen.Functions.Notify('Please make sure you have filled out a last name and make sure it is over 3 characters', '#EC4899')
    end
    if not dob or string.len(dob) < 3 then 
		return Zen.Functions.Notify('Please make sure you have filled out a birthday', '#EC4899')
    end
    if not gender or string.len(gender) < 3 then 
		return Zen.Functions.Notify('Please make sure you selected a gender', '#EC4899')
    end

    local success = lib.callback.await('fatal:registerPlayer', false, data)
    if success then 
        return toggleRegister(false) 
    end 
end

RegisterCommand('register', function()
    return toggleRegister(true)
end)

RegisterNetEvent('register:open', function()
    SetTimeout(3000, function()
        toggleRegister(true)
    end)
end)

RegisterNUICallback('closeUI', function()
    return toggleRegister(false, true)
end)

RegisterNUICallback('hideUI',  toggleRegister)
RegisterNUICallback('ConfirmRegister', confirmRegister)