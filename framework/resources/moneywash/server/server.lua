-- Money Wash Server-side Code

RegisterNetEvent('moneywash:process', function(exchangeRate, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    amount = tonumber(amount)
    if not amount or amount <= 0 then
        return Zen.Functions.Notify(source, 'Invalid amount!', 'xmark', '#EC4899')
    end

    -- Check limits
    local minAmount = Zen.Config.Server.Economy and Zen.Config.Server.Economy.MoneyWash.MinAmount or 100
    local maxAmount = Zen.Config.Server.Economy and Zen.Config.Server.Economy.MoneyWash.MaxAmount or 1000000

    if amount < minAmount then
        return Zen.Functions.Notify(source, 'Minimum amount is $' .. minAmount, 'dollar', '#EC4899')
    end

    if amount > maxAmount then
        return Zen.Functions.Notify(source, 'Maximum amount is $' .. maxAmount, 'dollar', '#EC4899')
    end

    local dirtyMoney = xPlayer.getAccount('black_money').money
    if dirtyMoney < amount then
        return Zen.Functions.Notify(source, 'Not enough dirty money!', 'dollar', '#EC4899')
    end

    -- Calculate clean money (with exchange rate loss)
    local cleanAmount = math.floor(amount * (exchangeRate or 0.85))

    -- Process wash
    xPlayer.removeAccountMoney('black_money', amount)
    xPlayer.addMoney(cleanAmount)

    Zen.Functions.Notify(source, 'Washed $' .. amount .. ' dirty money into $' .. cleanAmount .. ' clean cash!', 'dollar', '#0EA5E9')

    Zen.Functions.Log('Money Wash', ('%s washed $%s dirty into $%s clean'):format(
        xPlayer.getName(), amount, cleanAmount
    ), 16776960)
end)
