local Drugs = Zen.Config.Drugs
local DrugsData = { Busy = false, Pressed = false }
local currentTextUI = nil

-- Server tells us to stop (e.g. inventory full, missing items)
RegisterNetEvent('drugs:stopClient', function()
    DrugsData.Busy = false
    if currentTextUI then
        lib.hideTextUI()
        currentTextUI = nil
    end
end)

local function showText(text)
    if currentTextUI == text then return end
    if currentTextUI then
        lib.hideTextUI()
    end
    lib.showTextUI(text)
    currentTextUI = text
end

local function hideText()
    if currentTextUI then
        lib.hideTextUI()
        currentTextUI = nil
    end
end

-- Drug start handler - runs the collection/processing loop
AddEventHandler('drugs:start', function(drugData, locData, task)
    DrugsData.Busy = true
    Zen.Functions.Notify(('You Started %sing %s'):format(task, drugData.Name))

    -- Update text UI to show stop option
    showText(('Press [E] To Stop %sing %s'):format(task, drugData.Name))

    while true do
        Wait(locData.Time * 1000)
        if DrugsData.Busy then
            if playerDead then
                DrugsData.Busy = false
                break
            end
            TriggerServerEvent('drugs:receive', locData.Items)
        else
            break
        end
    end
end)

-- Drug stop handler
AddEventHandler('drugs:stop', function(drugData, task)
    DrugsData.Busy = false
    Zen.Functions.Notify(('You Stopped %sing %s'):format(task, drugData.Name))
    -- Reset text to show start option
    hideText()
end)

local function createDrugBlip(drugData, zone)
    local locData = drugData.Locations[zone]
    if not locData.Blip.Enabled then return end
    Zen.Functions.CreateBlip(locData.Blip.Coords, locData.Blip)
end

RegisterNetEvent('playerLoaded', function()
    for key in next, Drugs do
        local drugData = Drugs[key]

        for zone in next, drugData.Locations do
            local locData = drugData.Locations[zone]
            local marker = lib.points.new(locData.Coords, locData.Radius, { drug = key, zone = zone })

            if marker then
                createDrugBlip(drugData, zone)

                local Cooldown = false

                function marker:onExit()
                    DrugsData.Busy = false
                    Cooldown = true
                    hideText()
                    SetTimeout(locData.Time * 1000, function() Cooldown = false end)
                end

                function marker:nearby()
                    if not Cooldown then
                        local text = (DrugsData.Busy and 'Press [E] To Stop %sing %s' or 'Press [E] To Start %sing %s'):format(self.zone, drugData.Name)
                        showText(text)

                        if IsControlJustPressed(0, 38) and not DrugsData.Pressed then
                            DrugsData.Pressed = true

                            if DrugsData.Busy then
                                TriggerEvent('drugs:stop', drugData, self.zone)
                            else
                                TriggerEvent('drugs:start', drugData, locData, self.zone)
                            end

                            SetTimeout(locData.Time * 1000, function() DrugsData.Pressed = false end)
                        end
                    end
                end
            end
        end
    end
end)
