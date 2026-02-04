-- Community Service Server-side Code

local playersInService = {}

RegisterNetEvent('comserv:start', function(taskCount)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    playersInService[source] = {
        tasks = taskCount,
        completed = 0
    }

    TriggerClientEvent('comserv:start', source, taskCount)
    Zen.Functions.Notify(source, 'Community service started! Complete ' .. taskCount .. ' tasks.', 'broom', '#FFFF00')
end)

RegisterNetEvent('comserv:complete', function()
    local source = source

    if playersInService[source] then
        playersInService[source].completed = playersInService[source].completed + 1

        if playersInService[source].completed >= playersInService[source].tasks then
            playersInService[source] = nil
            TriggerClientEvent('comserv:finish', source)
            Zen.Functions.Notify(source, 'Community service completed!', 'check', '#0EA5E9')
        else
            local remaining = playersInService[source].tasks - playersInService[source].completed
            TriggerClientEvent('comserv:update', source, remaining)
            Zen.Functions.Notify(source, remaining .. ' tasks remaining', 'broom', '#FFFF00')
        end
    end
end)
