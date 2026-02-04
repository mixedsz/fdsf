-- Drugs Server-side Code

local function getESX()
    if not ESX then
        pcall(function()
            ESX = exports['es_extended']:getSharedObject()
        end)
    end
    return ESX
end

-- Receives drug items from client and handles Collect/Process/Sell logic
-- Items structure from config:
--   Collect: { Reward = { Name = 'weed', Amount = 1 } }
--   Process: { Reward = { Name = 'weed_pouch', Amount = 1 }, Need = { Name = 'weed', Amount = 10 } }
--   Sell:    { SellReward = { Amount = 35000 }, Need = { Name = 'weed_pouch', Amount = 1 } }
RegisterNetEvent('drugs:receive', function(items, zoneType)
    local source = source
    local esx = getESX()
    if not esx then return end
    local xPlayer = esx.GetPlayerFromId(source)
    if not xPlayer then return end

    if not items or type(items) ~= 'table' then return end

    -- Check if this is a Sell location (has SellReward)
    if items.SellReward then
        -- Sell: require Need items, give money
        if items.Need then
            local needItem = xPlayer.getInventoryItem(items.Need.Name)
            if not needItem or needItem.count < items.Need.Amount then
                TriggerClientEvent('showNotification', source, ('You need %dx %s'):format(items.Need.Amount, items.Need.Name), 'box', '#EC4899')
                TriggerClientEvent('drugs:stopClient', source)
                return
            end
            -- Remove required items
            xPlayer.removeInventoryItem(items.Need.Name, items.Need.Amount)
        end
        -- Give money reward
        xPlayer.addMoney(items.SellReward.Amount)
        TriggerClientEvent('showNotification', source, ('Sold for $%s'):format(items.SellReward.Amount), 'dollar', '#0EA5E9')

    -- Check if this is a Process location (has Need + Reward)
    elseif items.Need and items.Reward then
        -- Process: require Need items, give Reward items
        local needItem = xPlayer.getInventoryItem(items.Need.Name)
        if not needItem or needItem.count < items.Need.Amount then
            TriggerClientEvent('showNotification', source, ('You need %dx %s'):format(items.Need.Amount, items.Need.Name), 'box', '#EC4899')
            TriggerClientEvent('drugs:stopClient', source)
            return
        end
        -- Check if player can carry reward
        if not xPlayer.canCarryItem(items.Reward.Name, items.Reward.Amount) then
            TriggerClientEvent('showNotification', source, 'Inventory full!', 'box', '#EC4899')
            TriggerClientEvent('drugs:stopClient', source)
            return
        end
        -- Remove required items and give reward
        xPlayer.removeInventoryItem(items.Need.Name, items.Need.Amount)
        xPlayer.addInventoryItem(items.Reward.Name, items.Reward.Amount)
        TriggerClientEvent('showNotification', source, ('+%dx %s'):format(items.Reward.Amount, items.Reward.Name), 'box', '#0EA5E9')

    -- Collect location (only has Reward)
    elseif items.Reward then
        -- Collect: just give the reward item
        if not xPlayer.canCarryItem(items.Reward.Name, items.Reward.Amount) then
            TriggerClientEvent('showNotification', source, 'Inventory full!', 'box', '#EC4899')
            TriggerClientEvent('drugs:stopClient', source)
            return
        end
        xPlayer.addInventoryItem(items.Reward.Name, items.Reward.Amount)
        TriggerClientEvent('showNotification', source, ('+%dx %s'):format(items.Reward.Amount, items.Reward.Name), 'box', '#0EA5E9')
    end
end)
