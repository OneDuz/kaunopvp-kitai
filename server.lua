ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local allowedIdentifiers = {
    ['license:efdb4c07fa8367fcd7bea9dc660e539d89b9d13d'] = true,
    ['steam:1100001495e4c31'] = true,
    -- furma

    ['license:9e47b98f067ae06b7f76e06606f45ce1329360c5'] = true,
    ['steam:1100001440172ec'] = true,
    -- donce

    ['license:d29deb5a081383e041f401b876aab324d100fac6'] = true,
    ['steam:11000014677bdab'] = true,
    -- Luk1to

    ['license:7093a108e1d653fe19ed7a9f1ecaa489d9926ccb'] = true,
    ['steam:11000014e99295e'] = true,
    -- as nx
}


lib.callback.register('Checkifthecuntcandrivethis', function(source, vehiclemodel)
    local playerIdentifier = nil
    local identifiers = GetPlayerIdentifiers(source)
    for _, v in pairs(identifiers) do
        if string.match(v, 'steam:') or string.match(v, 'license:') then
            playerIdentifier = v
            break
        end
    end
    if playerIdentifier and allowedIdentifiers[playerIdentifier] then
        return true
    else
        return false, "Jūs negalite vairuoti šios tr. priemonės."
    end
end)


lib.callback.register('getlicensefromtagerid', function(source, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        -- print("ADMIN "..GetPlayerName(source).." "..xPlayer.getGroup().." ", source)
        local xTarget = ESX.GetPlayerFromId(target)
        local targetIdentifier = xTarget.identifier
        return targetIdentifier
    else
        -- print("NOT ADMIN "..GetPlayerName(source).." ", source)
        return false
    end
end)

lib.callback.register('getlicensefromtagerid3', function(source, target)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        -- print("ADMIN "..GetPlayerName(source).." "..xPlayer.getGroup().." ", source)
        -- print("target:", target)
        -- print("source:", source)
        exports.ox_inventory:forceOpenInventory(source, 'player', target)
        if inv then
            return true
        else
            return false
        end
    else
        -- print("NOT ADMIN "..GetPlayerName(source).." ", source)
        return false
    end
end)

lib.callback.register('getlicensefromtagerid2', function(source, target, inv)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        -- print("ADMIN"..GetPlayerName(source).." "..xPlayer.getGroup().." ", source)
        local xTarget = ESX.GetPlayerFromId(target)
        local targetIdentifier = xTarget.identifier
        local inv = exports.ox_inventory:ClearInventory({ id = inv, owner = targetIdentifier }, false)
        if inv then
            return true
        else
            return false
        end
    else
        -- print("NOT ADMIN "..GetPlayerName(source).." ", source)
        return false
    end
end)


ESX.RegisterServerCallback('esx_advancedgarage:getOwnedCars2', function(source, cb, targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() ~= "user" then
        print("ADMIN "..GetPlayerName(source).." "..xPlayer.getGroup().." ", source)
        local xTarget = ESX.GetPlayerFromId(targetId)
        local targetIdentifier = xTarget.identifier
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner', {
            ['@owner'] = targetIdentifier
        }, function(vehicles)
            cb(vehicles)
        end)
    else
        -- print("NOT ADMIN "..GetPlayerName(source).." ", source)
        cb(false)
    end
end)

lib.callback.register('one-codes:weather:SaveData', function(source, weather, time, autoLoad, timeFrozen, weatherFrozen)
    local xTarget = ESX.GetPlayerFromId(source)
    local identifier = xTarget.identifier
    MySQL.Async.execute('REPLACE INTO weather_data (license, weather, time, auto_load, time_frozen, weather_frozen) VALUES (@license, @weather, @time, @autoLoad, @timeFrozen, @weatherFrozen)', {
        ['@license'] = identifier,
        ['@weather'] = weather,
        ['@time'] = time,
        ['@autoLoad'] = autoLoad,
        ['@timeFrozen'] = timeFrozen,
        ['@weatherFrozen'] = weatherFrozen
    }, function(rowsChanged)
        saved = rowsChanged > 0
    end)
    Wait(150)
    -- Note: This might return before data is loaded due to async
    return saved
end)

lib.callback.register('one-codes:weather:LoadData', function(source)
    local xTarget = ESX.GetPlayerFromId(source)
    local identifier = xTarget.identifier
    local data = {weather = "Unknown", time = "Unknown", auto_load = true, time_frozen = false, weather_frozen = false}
    MySQL.Async.fetchAll('SELECT weather, time, auto_load, time_frozen, weather_frozen FROM weather_data WHERE license = @license', {
        ['@license'] = identifier
    }, function(result)
        if result and result[1] then
            data = result[1]
        end
    end)
    -- Note: This might return before data is loaded due to async
    Wait(150)
    return data
end)

-- local usedmedkits = {}

-- lib.callback.register('one-codes:medkit:used', function(source, type)
--     local getitem = exports.ox_inventory:GetItemCount(source, "medikit")
--     -- If getitem is 0 (or somehow nil), the player doesn't have any medkits, so we exit the function.
--     if not getitem or getitem <= 0 then return "no medkit" end 

--     if type == "started" then
--         -- Remove one medkit from the player's inventory as they are starting to use it.
--         exports.ox_inventory:RemoveItem(source, "medikit", 1)
--         usedmedkits[source] = true -- Record that this player has started using a medkit.
--         return "started"
--     elseif type == "complete" then
--         -- The player has completed using the medkit, remove their record.
--         usedmedkits[source] = nil -- Clear their status, as they've finished using the medkit.
--         return "complete"
--     elseif type == "cancelled" then
--         -- The player cancelled the action; check if they previously started to use a medkit.
--         if usedmedkits[source] then
--             -- Since they had started and then cancelled, give back the medkit.
--             exports.ox_inventory:AddItem(source, "medikit", 1)
--             usedmedkits[source] = nil -- Clear their usage record as the action was cancelled.
--         end
--         return "cancelled"
--     end
-- end)




AddEventHandler('ox_inventory:openedInventory', function(playerId, inventoryId)
    local word2 = nil
    if string.find(inventoryId, 'trunk') then
        word2 = inventoryId:match("trunk%s*(.+)")
    elseif string.find(inventoryId, 'glove') then
        word2 = inventoryId:match("glove%s*(.+)")
    end
    
    if word2 then
        local result = MySQL.Sync.fetchScalar("SELECT owner FROM owned_vehicles WHERE plate = @plate", {
            ['@plate'] = word2
        })
        if result then 
            -- print("allowed")
        else
            TriggerClientEvent("one-codes:InvClose:LOL", playerId)
        end
        -- print(inventoryId, word2)
    end
end)





-- lib.callback.register('ox_inventory:Checkowner', function(source, plate, cleanplate)
-- 	local localplate = plate
-- 	local cleanPlate = string.sub(plate, 3) -- Removes the first two characters
-- 	print(cleanplate)
-- 	if cleanplate then
-- 		localplate =  cleanPlate
-- 	end
-- 	print(localplate)
--     local result = MySQL.Sync.fetchScalar("SELECT owner FROM owned_vehicles WHERE plate = @plate", {
--         ['@plate'] = cleanPlate -- Use the cleaned plate here
--     })
--     if result then 
--         print("allowed")
--         return true
--     else
--         print("not allowed")
--         return false
--     end
-- end)