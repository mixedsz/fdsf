CreateThread(function()
    for _, info in pairs(Zen.Config.Blips) do
        local blipInfo = {
            Type = info.id,
            Scale = info.scale,
            Color = info.colour,
            Name = info.title
        }
        Zen.Functions.CreateBlip(info, blipInfo)
    end
end)