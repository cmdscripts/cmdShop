ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback("cmd-shops:checkinv", function(source, cb, b)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end

    if xPlayer.getInventoryItem(b.name).count + b.index - 1 >= b.max then
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Your inventory is full'})
        cb(false)
    else
        cb(true)
    end
end)

ESX.RegisterServerCallback("cmd-shops:checkmoney_cash", function(source, cb, b)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end

    if xPlayer.getMoney() >= b.price * b.index then
        xPlayer.removeMoney(b.price * b.index)
        xPlayer.addInventoryItem(b.name, b.index)
        TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Item purchased'})
        cb(true)
    else
        cb(false)
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Not enough cash'})
    end
end)

ESX.RegisterServerCallback("cmd-shops:checkmoney_bank", function(source, cb, b)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end

    if xPlayer.getAccount("bank").money >= b.price * b.index then
        xPlayer.removeAccountMoney("bank", b.price * b.index)
        xPlayer.addInventoryItem(b.name, b.index)
        TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Item purchased'})
        cb(true)
    else
        cb(false)
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Not enough money in bank'})
    end
end)

ESX.RegisterServerCallback("cmd-shops:checkmoney_blackmoney", function(source, cb, b)
    local xPlayer = ESX.GetPlayerFromId(source)

    if (not xPlayer) then return end

    if xPlayer.getAccount("black_money").money >= b.price * b.index then
        xPlayer.removeAccountMoney("black_money", b.price * b.index)
        xPlayer.addInventoryItem(b.name, b.index)
        TriggerClientEvent('ox_lib:notify', source, {type = 'success', description = 'Item purchased'})
        cb(true)
    else
        cb(false)
        TriggerClientEvent('ox_lib:notify', source, {type = 'error', description = 'Not enough black money'})
    end
end)