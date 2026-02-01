-- get farted on by drizzy shitty boy
-- sigma sigma boy sigma boy sigma sigma boy 
-- im a skid i dont know how to code or secure anything
-- these are all chatgpt comments lolz
-- if your reading this your gay

local pedCoords = vector3(6.6719, -1816.9297, 25.3541)
local pedHeading = 233.7772
local pedModel = `s_m_m_armoured_02`
local interactionDistance = 2.0
local isNearPed = false
local hasShownTextUI = false

local function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
end

CreateThread(function()
    loadModel(pedModel)
    local ped = CreatePed(0, pedModel, pedCoords.x, pedCoords.y, pedCoords.z - 1.0, pedHeading, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    -- Proximity detection loop
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local dist = #(playerCoords - pedCoords)

        if dist < interactionDistance then
            if not hasShownTextUI then
                lib.showTextUI('[E] - Talk to Open Menu')
                hasShownTextUI = true
            end

            if IsControlJustReleased(0, 38) then -- 38 = E
                TriggerEvent('custom:openWeaponMenu')
            end
        else
            if hasShownTextUI then
                lib.hideTextUI()
                hasShownTextUI = false
            end
        end

        Wait(0)
    end
end)

function openMainWeaponMenu()
    lib.registerContext({
        id = 'main_weapon_menu',
        title = 'Weapon Menu',
        options = {
            {
                title = 'Pink Weapon Pack',
                description = 'Puchase on the Tebex',
                onSelect = function()
                    TriggerServerEvent("custom:requestFemaleMenu")
                end
            },
            {
                title = 'Top Gunners',
                description = 'Exclusive Gang Weapon',
                onSelect = function()
                    TriggerServerEvent("custom:requestToxicMenu")
                end
            },
            {
                title = 'Rage AR',
                description = 'Limited Time AR',
                onSelect = function()
                    TriggerServerEvent("custom:requestRage1Menu")
                end
            },
            {
                title = 'Rage SR-47',
                description = 'Limited Time AR',
                onSelect = function()
                    TriggerServerEvent("custom:requestRageSR")
                end
            },
            {
                title = 'FGF SR-47',
                description = 'Exclusive Gang Weapon',
                onSelect = function()
                    TriggerServerEvent("custom:requesttjaySR")
                end
            },
            {
                title = 'Habibi Guns',
                description = 'Exclusive Personal Weapon',
                onSelect = function()
                    TriggerServerEvent("custom:requestxheo")
                end
            }
        }
    })

    lib.showContext('main_weapon_menu')
end

RegisterNetEvent("custom:openWeaponMenu", function()
    openMainWeaponMenu()
end)

RegisterNetEvent("custom:openToxicMenu", function()
    lib.registerContext({
        id = 'toxic_gun_menu',
        title = 'Toxic Gun Menu',
        options = {
            {
                title = 'Top Gunners AR',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_topgunnersar")
                end
            }, 
            {
                title = 'Top Gunners',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_topgunners")
                end
            },
            {
                title = 'TG Switch',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_topgunnerswitch")
                end
            },
        }
    })

    lib.showContext('toxic_gun_menu')
end)

RegisterNetEvent("custom:openRage1Menu", function()
    lib.registerContext({
        id = 'rage_gun_menu',
        title = 'Rage Gun Menu',
        options = {
            {
                title = 'Rage AR',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_ragerp")
                end
            },
        }
    })

    lib.showContext('rage_gun_menu')
end)

RegisterNetEvent("custom:openhxppy", function()
    lib.registerContext({
        id = 'hxppy_gun_menu',
        title = 'Hxppy Gun Menu',
        options = {
            {
                title = 'M27-IAR',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_m27")
                end
            },
        }
    })

    lib.showContext('hxppy_gun_menu')
end)

RegisterNetEvent("custom:openRageSR", function()
    lib.registerContext({
        id = 'ragesr_gun_menu',
        title = 'Rage Gun Menu',
        options = {
            {
                title = 'Rage SR-47',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_rapidsr-47")
                end
            },
        }
    })

    lib.showContext('ragesr_gun_menu')
end)

RegisterNetEvent("custom:openxheo", function()
    lib.registerContext({
        id = 'xheo_gun_menu',
        title = 'Dildo Menu',
        options = {
            {
                title = 'Pink Dildo',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_pinkdildo")
                end
            },
            {
                title = 'Purple Dildo',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_purpledildo")
                end
            },
        }
    })

    lib.showContext('xheo_gun_menu')
end)

RegisterNetEvent("custom:openwrld", function()
    lib.registerContext({
        id = 'wrld_gun_menu',
        title = 'Wrlds Menu',
        options = {
            {
                title = 'THETAPYAHEADBYDEE',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_thetapyahead")
                end
            },
        }
    })

    lib.showContext('wrld_gun_menu')
end)

RegisterNetEvent("custom:opentjaySR", function()
    lib.registerContext({
        id = 'tjaysr_gun_menu',
        title = 'FGF Gun Menu',
        options = {
            {
                title = 'Tjay SR-47',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_tjaysr-47")
                end
            },
            {
                title = 'FGFSWITCH',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "weapon_fgfswitch")
                end
            },
        }
    })

    lib.showContext('tjaysr_gun_menu')
end)

RegisterNetEvent("custom:openFemaleMenu", function()
    lib.registerContext({
        id = 'female_gun_menu',
        title = 'Female Guns Menu',
        options = {
            {
                title = 'PINK MICRODRACO',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_FMICRODRACO")
                end
            },
            {
                title = 'PINK SCAR-H',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PSCAR")
                end
            },
            {
                title = 'PINK SPAS-12',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_SPAS12")
                end
            },
            {
                title = 'PINK M4 SANDSM',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PM4")
                end
            },
            {
                title = 'PINK B&T MP9l',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PMP9")
                end
            },
            {
                title = 'PINK 1911 KT',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_P1911KT")
                end
            },
            {
                title = 'PINK GLOCK 19',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PG19")
                end
            },
            {
                title = 'PINK P320 RXP',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PSP320")
                end
            },
            {
                title = 'PINK COLT M4A1',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PM4A1")
                end
            },
            {
                title = 'PINK MK18 M1',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PMK181")
                end
            },
            {
                title = 'PINK XDS9',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PXDS9")
                end
            },
            {
                title = 'PINK GLOCK 17C',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PGLOCK17C")
                end
            },
            {
                title = 'PINK MK14',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PMK14")
                end
            },
            {
                title = 'PINK HK45',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_PHK45")
                end
            },
            {
                title = 'PINK 941 PSL',
                icon = 'gun',
                onSelect = function()
                    TriggerServerEvent("custom:giveWeapon", "WEAPON_P941")
                end
            },
        }
    })

    lib.showContext('female_gun_menu')
end)