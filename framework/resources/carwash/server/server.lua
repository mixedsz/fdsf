-- Car Wash Server-side Code
local Carwash = Zen.Config.CarWash

RegisterNetEvent('carwash:pay', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local price = Carwash and Carwash.Price or 100

    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('carwash:start', source)
        Zen.Functions.Notify(source, 'Car wash started! -$' .. price, 'car', '#00FF00')
    else
        Zen.Functions.Notify(source, 'Not enough money!', 'dollar', '#FF0000')
    end
end)
