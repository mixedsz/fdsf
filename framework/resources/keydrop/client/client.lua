-- client.lua
RegisterCommand('keydrop', function()
    local hasPerm = lib.callback.await('keydrop:hasKeyPermission')
    if not hasPerm then
        lib.notify({title = 'Access Denied', description = 'You do not have permission to use this command.', type = 'error'})
        return
    end

    local input = lib.inputDialog('Key Drop', {
        {type = 'select', label = 'Duration', options = KeyDropConfig.Durations, required = true},
        {type = 'multi-select', label = 'Key Types', options = KeyDropConfig.Keys, required = true},
        {type = 'number', label = 'Amount (Max 10)', min = 1, max = 10, required = true}
    })

    if not input then return end

    local duration = input[1]
    local keys = input[2]
    local amount = input[3]
    local keyLabels = {}
    for _, key in ipairs(keys) do
        for _, configKey in ipairs(KeyDropConfig.Keys) do
            if configKey.value == key then
                table.insert(keyLabels, configKey.label)
            end
        end
    end
    local keyList = table.concat(keyLabels, ", ")

    TriggerServerEvent('keydrop:schedule', duration, keys, amount)
    lib.notify({
        title = 'Key Drop',
        description = 'Scheduled drop of ' .. amount .. 'x ' .. keyList .. ' in ' .. duration .. ' mins.',
        type = 'success'
    })
end, false)

RegisterCommand('coindrop', function()
    local hasPerm = lib.callback.await('keydrop:hasCoinPermission')
    if not hasPerm then
        lib.notify({title = 'Access Denied', description = 'You do not have permission to use this command.', type = 'error'})
        return
    end

    local input = lib.inputDialog('Coin Drop', {
        {type = 'select', label = 'Duration', options = KeyDropConfig.Durations, required = true},
        {type = 'select', label = 'Coin Amount', options = KeyDropConfig.Coins, required = true}
    })

    if not input then return end

    local duration = input[1]
    local coins = input[2]
    
    TriggerServerEvent('coindrop:schedule', duration, coins)
    lib.notify({
        title = 'Coin Drop',
        description = 'Scheduled drop of ' .. coins .. ' coins in ' .. duration .. ' mins.',
        type = 'success'
    })
end, false)