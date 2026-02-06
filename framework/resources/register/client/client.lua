-- Register Client - Uses ox_lib input dialog
local isRegistering = false

local function openRegister()
    if isRegistering then return end
    isRegistering = true

    -- Freeze player during registration
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)
    SetEntityVisible(ped, false, false)

    -- Small delay for UI to be ready
    Wait(500)

    local input = lib.inputDialog('Create Your Character', {
        { type = 'input', label = 'First Name', description = 'Enter your character\'s first name', required = true, min = 3, max = 20 },
        { type = 'input', label = 'Last Name', description = 'Enter your character\'s last name', required = true, min = 3, max = 20 },
        { type = 'date', label = 'Date of Birth', description = 'Select your birthday', required = true, format = 'YYYY-MM-DD', default = '1990-01-01' },
        { type = 'select', label = 'Gender', description = 'Select your gender', required = true, options = {
            { value = 'male', label = 'Male' },
            { value = 'female', label = 'Female' }
        }}
    })

    if not input then
        -- Player cancelled - reopen
        isRegistering = false
        Wait(500)
        return openRegister()
    end

    local data = {
        firstName = input[1],
        lastName = input[2],
        birthday = input[3],
        gender = input[4]
    }

    -- Validate
    if not data.firstName or #data.firstName < 3 then
        Zen.Functions.Notify('First name must be at least 3 characters!', 'xmark', '#EC4899')
        isRegistering = false
        Wait(500)
        return openRegister()
    end

    if not data.lastName or #data.lastName < 3 then
        Zen.Functions.Notify('Last name must be at least 3 characters!', 'xmark', '#EC4899')
        isRegistering = false
        Wait(500)
        return openRegister()
    end

    -- Only allow letters
    if not data.firstName:match('^[a-zA-Z]+$') or not data.lastName:match('^[a-zA-Z]+$') then
        Zen.Functions.Notify('Names can only contain letters!', 'xmark', '#EC4899')
        isRegistering = false
        Wait(500)
        return openRegister()
    end

    -- Send to server
    local success = lib.callback.await('fatal:registerPlayer', false, data)

    if success then
        Zen.Functions.Notify('Character created! Welcome ' .. data.firstName .. ' ' .. data.lastName, 'check', '#0EA5E9')

        -- Unfreeze and show player
        FreezeEntityPosition(ped, false)
        SetEntityVisible(ped, true, false)

        -- Enable controls and UI
        ToggleUIs(true)

        isRegistering = false
    else
        Zen.Functions.Notify('Registration failed! Please try again.', 'xmark', '#EC4899')
        isRegistering = false
        Wait(500)
        return openRegister()
    end
end

-- Command to manually open register (for testing)
RegisterCommand('register', function()
    openRegister()
end, false)

-- Event triggered by server when player needs to register
RegisterNetEvent('register:open', function()
    openRegister()
end)
