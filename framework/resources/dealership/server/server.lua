-- Dealership Server-side Code

-- Buy vehicle callback
lib.callback.register('vehicleshop:buy', function(source, props, vehicleType, price, discount, label)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    local finalPrice = price
    if discount then
        finalPrice = math.floor(price * (1 - discount))
    end

    -- Check bank balance
    local bankBalance = xPlayer.getAccount('bank').money

    if bankBalance >= finalPrice then
        xPlayer.removeAccountMoney('bank', finalPrice)

        -- Insert vehicle into database
        MySQL.insert.await('INSERT INTO owned_vehicles (owner, plate, vehicle, type, job) VALUES (?, ?, ?, ?, ?)', {
            xPlayer.identifier,
            props.plate,
            json.encode(props),
            vehicleType or 'car',
            nil
        })

        Zen.Functions.Notify(source, 'Vehicle purchased for $' .. finalPrice .. '!', 'car', '#0EA5E9')

        Zen.Functions.Log('Vehicle Purchase', ('%s purchased %s for $%s (Plate: %s)'):format(
            xPlayer.getName(), label or 'Unknown', finalPrice, props.plate
        ), 65280)

        return true
    else
        Zen.Functions.Notify(source, 'Not enough money in bank!', 'dollar', '#EC4899')
        return false
    end
end)
