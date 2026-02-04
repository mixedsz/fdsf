-- Register Server-side Code

lib.callback.register('fatal:registerPlayer', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    if not data.firstName or not data.lastName or not data.birthday or not data.gender then
        return false
    end

    -- Check for blacklisted words
    local fullName = (data.firstName .. ' ' .. data.lastName):lower()
    for _, word in pairs(Zen.Config.Server.BlacklistedWords or {}) do
        if string.find(fullName, word:lower()) then
            Zen.Functions.Notify(source, 'Invalid name!', 'xmark', '#EC4899')
            return false
        end
    end

    -- Update player data in database
    MySQL.update.await('UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ? WHERE identifier = ?', {
        data.firstName,
        data.lastName,
        data.birthday,
        data.gender == 'male' and 'm' or 'f',
        xPlayer.identifier
    })

    -- Update player name state
    local ply = Player(source)
    ply.state:set('name', data.firstName .. ' ' .. data.lastName, true)

    Zen.Functions.Notify(source, 'Registration complete!', 'check', '#0EA5E9')

    Zen.Functions.Log('Player Registered', ('%s registered as %s %s'):format(
        xPlayer.identifier, data.firstName, data.lastName
    ), 65280)

    return true
end)

-- Check if player needs to register
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    local result = MySQL.single.await('SELECT firstname, lastname FROM users WHERE identifier = ?', { xPlayer.identifier })

    if not result or not result.firstname or result.firstname == '' then
        TriggerClientEvent('register:open', playerId)
    end
end)
