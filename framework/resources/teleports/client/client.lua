local Config = Zen.Config.Teleports
local teleportCooldown = false

for i = 1, #Config do
    local point = lib.points.new(Config[i][2], 3, { text = Config[i][1], from = Config[i][2], to = Config[i][3] })

    function point:nearby()
        Zen.Functions.FloatText(self.from, '[E] - '..self.text)

        -- Only teleport when E is explicitly pressed and within range
        if self.currentDistance < 1.5 and not teleportCooldown and IsControlJustPressed(0, 38) then
            teleportCooldown = true
            SetEntityCoords(cache.ped, self.to.x, self.to.y, self.to.z, false, false, false, false)
            if self.to.w then
                SetEntityHeading(cache.ped, self.to.w)
            end
            SetTimeout(2000, function() teleportCooldown = false end)
        end
    end
end