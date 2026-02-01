-- HUD Server-side Code
-- HUD is mostly client-side, but we sync some data

-- Sync money updates
RegisterNetEvent('esx:setAccountMoney', function(account)
    local source = source
    TriggerClientEvent('esx:setAccountMoney', source, account)
end)

-- Sync job updates
RegisterNetEvent('esx:setJob', function(job)
    local source = source
    local ply = Player(source)
    ply.state:set('job', job, true)
    TriggerClientEvent('esx:setJob', source, job)
end)
