local leaderboard = nil
local leaderboardOpen = false

RegisterNetEvent('gangs:change', function(value)
    local data = {}

    for k,v in pairs(value) do
        data[#data+1] = {
            name = v.name,
            kills = v.kills or 0,
            turfs = v.turfs or 0
        }
    end

    table.sort(data, function(a, b) return (a.turfs or 0) > (b.turfs or 0) end)

    leaderboard = data
end)

local function GangLeaderBoard()
    -- Fetch fresh data from server every time /lb is used
    local serverData = lib.callback.await('leaderboard:getData', false)
    if serverData and #serverData > 0 then
        leaderboard = serverData
    end

    if not leaderboard or #leaderboard == 0 then
        Zen.Functions.Notify('No gang data available', 'users', '#EC4899')
        return
    end

    leaderboardOpen = true

    SetNuiFocus(true, true)
    Zen.Functions.NUI('showLeaderboard', {
        GetLeaderData = leaderboard
    })
end

RegisterNUICallback('closeLeaderboard', function(_, cb)
    leaderboardOpen = false
    SetNuiFocus(false, false)
    return cb('ok')
end)

RegisterCommand('lb', GangLeaderBoard)
