-- Key Drop Server-side Code

-- Helper function to check key permission
local function hasKeyPermission(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check if player is admin
    local group = xPlayer.getGroup()
    if group == 'admin' or group == 'superadmin' then
        return true
    end

    return false
end

-- Helper function to check coin permission
local function hasCoinPermission(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Check if player is admin
    local group = xPlayer.getGroup()
    if group == 'admin' or group == 'superadmin' then
        return true
    end

    return false
end

-- Schedule key drop
RegisterNetEvent('keydrop:schedule', function(duration, keys, amount)
    local source = source

    -- Verify permission
    if not hasKeyPermission(source) then
        Zen.Functions.Notify(source, 'No permission!', 'xmark', '#FF0000')
        return
    end

    duration = tonumber(duration) or 5

    -- Schedule the drop
    SetTimeout(duration * 60 * 1000, function()
        -- Get all online players
        local players = GetPlayers()
        if #players == 0 then return end

        -- Select random player
        local winnerId = players[math.random(#players)]
        local xWinner = ESX.GetPlayerFromId(winnerId)

        if xWinner then
            for _, keyName in pairs(keys) do
                if xWinner.canCarryItem(keyName, amount) then
                    xWinner.addInventoryItem(keyName, amount)
                end
            end

            Zen.Functions.Notify(winnerId, 'You won the key drop!', 'key', '#FFD700')
            Zen.Functions.NotifyAll(xWinner.getName() .. ' won the key drop!', 'key', '#FFD700')

            Zen.Functions.Log('Key Drop', ('%s won %sx keys'):format(xWinner.getName(), amount), 16776960)
        end
    end)

    Zen.Functions.NotifyAll('Key drop starting in ' .. duration .. ' minutes!', 'key', '#FFD700')
end)

-- Schedule coin drop
RegisterNetEvent('coindrop:schedule', function(duration, coinAmount)
    local source = source

    -- Verify permission
    if not hasCoinPermission(source) then
        Zen.Functions.Notify(source, 'No permission!', 'xmark', '#FF0000')
        return
    end

    duration = tonumber(duration) or 5
    coinAmount = tonumber(coinAmount) or 1000

    -- Schedule the drop
    SetTimeout(duration * 60 * 1000, function()
        -- Get all online players
        local players = GetPlayers()
        if #players == 0 then return end

        -- Select random player
        local winnerId = players[math.random(#players)]
        local xWinner = ESX.GetPlayerFromId(winnerId)

        if xWinner then
            xWinner.addMoney(coinAmount)

            Zen.Functions.Notify(winnerId, 'You won $' .. coinAmount .. ' from the coin drop!', 'coins', '#FFD700')
            Zen.Functions.NotifyAll(xWinner.getName() .. ' won $' .. coinAmount .. ' from the coin drop!', 'coins', '#FFD700')

            Zen.Functions.Log('Coin Drop', ('%s won $%s'):format(xWinner.getName(), coinAmount), 16776960)
        end
    end)

    Zen.Functions.NotifyAll('Coin drop starting in ' .. duration .. ' minutes!', 'coins', '#FFD700')
end)
