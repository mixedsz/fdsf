local leaderboard = nil
leaderboardOpen = false

RegisterNetEvent('gangs:change', function(value)
    local data = {}

    for k,v in pairs(value) do 
        data[#data+1] = {
            name = v.name,
            kills = v.kills,
            turfs = v.turfs
        }
    end

    table.sort(data, function(a, b) return (a.turfs or 0) > (b.turfs or 0) end)

    leaderboard = data
end)

local function GangLeaderBoard()
    if leaderboard == nil then return end
    
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