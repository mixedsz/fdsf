-- Green Zones Server-side Code
-- Green zones are client-side safe areas, this handles server validation

RegisterNetEvent('greenzones:enter', function(zoneId)
    local source = source
    local ply = Player(source)
    ply.state:set('inGreenzone', true, true)
end)

RegisterNetEvent('greenzones:exit', function(zoneId)
    local source = source
    local ply = Player(source)
    ply.state:set('inGreenzone', false, true)
end)
