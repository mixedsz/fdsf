local Drugs = Zen.Config.Drugs
local DrugsData = { Busy = false, Pressed = false }
local textVisible = false
local lastTextContent = nil
local insideDrugZone = false
local activeDrugZone = nil
local activeDrugData = nil

-- Server tells us to stop (e.g. inventory full, missing items)
RegisterNetEvent('drugs:stopClient', function()
    DrugsData.Busy = false
    if textVisible then
        lib.hideTextUI()
        textVisible = false
        lastTextContent = nil
    end
end)

local function safeShowText(text)
    if lastTextContent == text and textVisible then return end
    if textVisible then
        lib.hideTextUI()
        textVisible = false
    end
    lib.showTextUI(text)
    textVisible = true
    lastTextContent = text
end

local function safeHideText()
    if textVisible then
        lib.hideTextUI()
        textVisible = false
        lastTextContent = nil
    end
end

-- Drug start handler - runs the collection/processing loop
AddEventHandler('drugs:start', function(drugData, locData, task)
    DrugsData.Busy = true

    -- Update text UI to show stop option
    if insideDrugZone then
        safeShowText(('Press [E] To Stop %sing %s'):format(task, drugData.Name))
    end

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
    -- Show start text again if still in zone
    if insideDrugZone and activeDrugZone then
        safeShowText(('Press [E] To Start %sing %s'):format(activeDrugZone, activeDrugData.Name))
    end
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

                function marker:onEnter()
                    if not Cooldown then
                        insideDrugZone = true
                        activeDrugZone = self.zone
                        activeDrugData = drugData
                        local text = (DrugsData.Busy and 'Press [E] To Stop %sing %s' or 'Press [E] To Start %sing %s'):format(self.zone, drugData.Name)
                        safeShowText(text)
                    end
                end

                function marker:onExit()
                    DrugsData.Busy = false
                    Cooldown = true
                    insideDrugZone = false
                    activeDrugZone = nil
                    activeDrugData = nil
                    safeHideText()
                    SetTimeout(locData.Time * 1000, function() Cooldown = false end)
                end

                function marker:nearby()
                    -- Only handle key press in nearby, text is shown in onEnter
                    if not Cooldown then
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
