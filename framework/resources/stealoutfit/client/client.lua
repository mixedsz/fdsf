local lastCooldown = 0
local cooldown = (Config.StealOutfit.Cooldown or 5) * 1000 

lib.callback.register("stableDev:client:getOutfit", function()
    return exports["illenium-appearance"]:getPedAppearance(cache.ped)
end)

local function showMenu()
    local input = lib.inputDialog("Steal Outfit", {
        {
            type = "input",
            label = "Enter Player ID",
            description = "Type the player's server ID to steal their outfit",
            required = true
        }
    })

    if not input or not input[1] then return end

    local targetId = tonumber(input[1])
    if not targetId or not GetPlayerName(targetId) then
        lib.notify({
            title = "Error",
            description = "Invalid player ID entered.",
            position = "top-right",
            type = "error"
        })
        return
    end

    local playerName = GetPlayerName(targetId)
    local playerSkin = lib.callback.await("stableDev:server:getPlayerOutfit", false, targetId)

    if not playerSkin then
        lib.notify({
            title = "Error",
            description = "Failed to fetch player appearance.",
            position = "top-right",
            type = "error"
        })
        return
    end

    exports["illenium-appearance"]:setPlayerAppearance(playerSkin)
    lastCooldown = GetGameTimer()

    lib.notify({
        title = "Success",
        description = "You have stolen " .. playerName .. "'s outfit!",
        position = "top-right",
        type = "success"
    })
end

if Config.StealOutfit.Enabled then
    RegisterCommand("stealoutfit", function()
        local hasRole = exports["framework"]:functions("IsRolePresent")(Config.StealOutfit.Role)
        if not hasRole then
            lib.notify({
                title = "Error",
                description = "You don't have access to this!",
                position = "top-right",
                type = "error"
            })
            return
        end

        local now = GetGameTimer()
        if now - lastCooldown < cooldown then
            local remaining = math.ceil((cooldown - (now - lastCooldown)) / 1000)
            lib.notify({
                title = "Cooldown",
                description = "Please wait " .. remaining .. "s before stealing another outfit.",
                position = "top-right",
                type = "error"
            })
            return
        end

        showMenu()
    end)
end