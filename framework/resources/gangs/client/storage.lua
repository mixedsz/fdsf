lib.registerMenu({ 
    id = 'gang_storage_menu', 
    title = 'Gang Storage', 
    position = 'bottom-right',
    onClose = function()
        lib.showMenu('management_menu')
    end,
    options = {}
}, function(selected, scrollIndex, args)
    if args and args.menu then 
        openStorageTypeMenu(args.menu, args.type, args.values)
    end
end)

lib.registerMenu({
    id = 'storage_accounts_withdraw_options',
    title = 'Witdrawing From Account',
    position = 'bottom-right',
    options = {},
    onClose = function() lib.showMenu('gang_storage_accounts') end
}, function(selected, scrollIndex, args)
    if args then 
        local input = lib.inputDialog('Witdraw '..Zen.Accounts[args.name], { {type = 'number', label = 'Amount', icon = 'dollar'} })

        if not input then 
            return lib.showMenu('storage_accounts_withdraw_options')
        end

        TriggerServerEvent('gangs:storages:withdraw', stateBag.gang, { withdrawed = input[1], item = args.name, type = args.type, count = args.count })
    end
end)

lib.registerMenu({
    id = 'storage_accounts_deposit_options',
    title = 'Depositing To Account',
    position = 'bottom-right',
    options = {},
    onClose = function() lib.showMenu('gang_storage_accounts') end
}, function(selected, scrollIndex, args)
    if args then 
        local input = lib.inputDialog('Deposit '..Zen.Accounts[args.name], { {type = 'number', label = 'Amount', icon = 'dollar'} })

        if not input then 
            return lib.showMenu('storage_accounts_deposit_options')
        end

        TriggerServerEvent('gangs:storages:deposit', stateBag.gang, { deposited = input[1], item = args.name, type = args.type, count = args.count })
    end
end)

lib.registerMenu({
    id = 'gang_storage_accounts',
    title = 'Accounts',
    position = 'bottom-right',
    options = {},
    onClose = function() lib.showMenu('gang_storage_menu') end
}, function(selected, scrollIndex, args) 
    if args.action == 'storage_accounts_withdraw' then 
        if args.data then 
            local aOptions = {}
            for key, i in next, args.data do
                if i > 0 then
                    aOptions[#aOptions+1] = { 
                        label = Zen.Accounts[key]..' $'..Zen.Functions.FormatCommas(i),
                        args = {
                            count = i, 
                            type = 'account', 
                            name = key
                        }
                    }
                end
            end

            if table.type(aOptions) == 'empty' then 
                return Zen.Functions.Notify('No Accounts Available', 'xmark', '#FF0000')
            end

            lib.setMenuOptions('storage_accounts_withdraw_options', aOptions)
            lib.showMenu('storage_accounts_withdraw_options')
        end

    elseif args.action == 'storage_accounts_deposit' then 
        if args.data then 
            local aOptions = {}
            for i = 1, #args.data do
                if args.data[i].money > 0 and args.data[i].name ~= 'bank' then 
                    aOptions[#aOptions+1] = { 
                        label = args.data[i].label..' $'..Zen.Functions.FormatCommas(args.data[i].money),
                        args = {
                            count = args.data[i].money, 
                            type = 'account', 
                            name = args.data[i].name
                        }
                    }
                end
            end

            if table.type(aOptions) == 'empty' then 
                return Zen.Functions.Notify('No Accounts Available', 'xmark', '#FF0000')
            end

            lib.setMenuOptions('storage_accounts_deposit_options', aOptions)
            lib.showMenu('storage_accounts_deposit_options')
        end
    end
end)

lib.registerMenu({
    id = 'storage_items_withdraw_options',
    title = 'Taking Out Items From Storage',
    position = 'bottom-right',
    options = {},
    onClose = function() lib.showMenu('gang_storage_items') end
}, function(selected, scrollIndex, args)
    if args then 
        local input = lib.inputDialog('Take Out '..args.label, { {type = 'number', label = 'Amount', icon = 'box'} })

        if not input then 
            return lib.showMenu('storage_items_withdraw_options')
        end

        TriggerServerEvent('gangs:storages:withdraw', stateBag.gang, { withdrawed = input[1], item = args.name, type = args.type, count = args.count })
    end
end)

lib.registerMenu({
    id = 'storage_items_deposit_options',
    title = 'Putting Items In Storage',
    position = 'bottom-right',
    options = {},
    onClose = function() lib.showMenu('gang_storage_items') end
}, function(selected, scrollIndex, args)
    if args then 
        local input = lib.inputDialog('Put In '..args.label, { {type = 'number', label = 'Amount', icon = 'box'} })

        if not input then 
            return lib.showMenu('storage_items_deposit_options')
        end

        TriggerServerEvent('gangs:storages:deposit', stateBag.gang, { deposited = input[1], item = args.name, type = args.type, count = args.count })
    end
end)

lib.registerMenu({
    id = 'gang_storage_items',
    title = 'Items',
    position = 'bottom-right',
    options = {},
    onClose = function() lib.showMenu('gang_storage_menu') end
}, function(selected, scrollIndex, args) 
    if args.action == 'storage_items_withdraw' then 
        if args.data then 
            local iOptions = {}
            for key, i in next, args.data do
                iOptions[#iOptions+1] = {
                    label = Zen.Items[key].label..' #'..i,
                    args = {
                        label = Zen.Items[key].label,
                        name = key,
                        count = i,
                        type = 'item',
                    }
                }
            end

            if table.type(iOptions) == 'empty' then 
                return Zen.Functions.Notify('No Items Available', 'xmark', '#FF0000')
            end

            lib.setMenuOptions('storage_items_withdraw_options', iOptions)
            lib.showMenu('storage_items_withdraw_options')
        end
    elseif args.action == 'storage_items_deposit' then 
        if args.data then 
            local iOptions = {}
            for i = 1, #args.data do
                local data = args.data[i]
                if data.count > 0 and Zen.Items[data.name].canRemove then 
                    iOptions[#iOptions+1] = { 
                        label = data.label..' #'..data.count,
                        args = {
                            label = data.label,
                            name = data.name,
                            count = data.count,
                            type = 'item',
                        }
                    }
                end
            end

            if table.type(iOptions) == 'empty' then 
                return Zen.Functions.Notify('No Items Available', 'xmark', '#FF0000')
            end

            lib.setMenuOptions('storage_items_deposit_options', iOptions)
            lib.showMenu('storage_items_deposit_options')
        end
    end
end)

local function openStorageInventory(name)
    local storage = lib.callback.await('gangs:storage:getData', false, name)
    
    lib.setMenuOptions('gang_storage_menu', {
        {
            icon = 'dollar',
            label = 'Manage Accounts',
            args = {
                type = 'accounts',
                menu = 'gang_storage_accounts',
                values = storage.accounts or {}
            }
        },
        {
            icon = 'box',
            label = 'Manage Items',
            args = {
                type = 'items',
                menu = 'gang_storage_items',
                values = storage.items or {}
            }
        }
    })
    lib.showMenu('gang_storage_menu')
end

RegisterNetEvent('gangs:storage:open', openStorageInventory) 

openStorageTypeMenu = function(menu, type, values)
    if menu == 'gang_storage_accounts' then 
        lib.setMenuOptions('gang_storage_accounts', {
            {
                icon = 'money-check-dollar',
                label = 'Withdraw From Account',
                args = {
                    action = 'storage_accounts_withdraw',
                    data = values
                }
            },
            {
                icon = 'money-check',
                label = 'Deposit To Account',
                args = {
                    action = 'storage_accounts_deposit',
                    data = ESX.GetPlayerData().accounts
                }
            }
        })

    elseif menu == 'gang_storage_items' then 
        lib.setMenuOptions('gang_storage_items', {
            {
                icon = 'rotate-left',
                label = 'Take Out Item(s)',
                args = {
                    action = 'storage_items_withdraw',
                    data = values
                }
            },
            {
                icon = 'rotate-right',
                label = 'Put In Item(s)',
                args = {
                    action = 'storage_items_deposit',
                    data = ESX.GetPlayerData().inventory
                }
            }
        })
    end

    lib.showMenu(menu)
end