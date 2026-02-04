-- Billing Server-side Code

-- Send bill to player
RegisterNetEvent('billing:send', function(targetId, society, label, amount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then return end

    -- Insert bill into database
    MySQL.insert.await('INSERT INTO billing (identifier, sender, label, amount, society, paid) VALUES (?, ?, ?, ?, ?, 0)', {
        xTarget.identifier,
        xPlayer.identifier,
        label,
        amount,
        society
    })

    -- Update client bills
    local bills = MySQL.query.await('SELECT * FROM billing WHERE identifier = ? AND paid = 0', { xTarget.identifier })
    TriggerClientEvent('billing:menu', targetId, bills or {})

    Zen.Functions.Notify(source, 'Bill sent to player!', 'file-invoice', '#0EA5E9')
    Zen.Functions.Notify(targetId, 'You received a bill for $' .. amount .. ' - ' .. label, 'file-invoice', '#EC4899')
end)

-- Pay bill
RegisterNetEvent('billing:pay', function(billId)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local bill = MySQL.single.await('SELECT * FROM billing WHERE id = ? AND identifier = ? AND paid = 0', {
        billId, xPlayer.identifier
    })

    if not bill then
        return Zen.Functions.Notify(source, 'Bill not found!', 'xmark', '#EC4899')
    end

    local bankBalance = xPlayer.getAccount('bank').money
    if bankBalance < bill.amount then
        return Zen.Functions.Notify(source, 'Not enough money in bank!', 'dollar', '#EC4899')
    end

    -- Pay the bill
    xPlayer.removeAccountMoney('bank', bill.amount)

    -- Add money to society
    if bill.society and bill.society ~= '' then
        TriggerEvent('esx_addonaccount:getSharedAccount', bill.society, function(account)
            if account then
                account.addMoney(bill.amount)
            end
        end)
    end

    -- Mark bill as paid
    MySQL.update.await('UPDATE billing SET paid = 1 WHERE id = ?', { billId })

    -- Update client bills
    local bills = MySQL.query.await('SELECT * FROM billing WHERE identifier = ? AND paid = 0', { xPlayer.identifier })
    TriggerClientEvent('billing:menu', source, bills or {})

    Zen.Functions.Notify(source, 'Bill paid!', 'check', '#0EA5E9')
end)

-- On player load, send their bills
AddEventHandler('playerLoaded', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local bills = MySQL.query.await('SELECT * FROM billing WHERE identifier = ? AND paid = 0', { xPlayer.identifier })
    TriggerClientEvent('billing:menu', source, bills or {})
end)
