if teamCloud.Framework == "esx" then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif teamCloud.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif teamCloud.Framework == "oldqb" then
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
else
    print('[deniz-dispatch] WRONG FRAMEWORK! PLEASE CHANGE IT FROM SHARED FILE!')
    print('[deniz-dispatch] WRONG FRAMEWORK! PLEASE CHANGE IT FROM SHARED FILE!')
    print('[deniz-dispatch] WRONG FRAMEWORK! PLEASE CHANGE IT FROM SHARED FILE!')
    print('[deniz-dispatch] WRONG FRAMEWORK! PLEASE CHANGE IT FROM SHARED FILE!')
end

function isAuthPD(job)
    for i = 1, #teamCloud["PDJob"] do
        if job == teamCloud["PDJob"][i] then
            return true
        end
    end
    return false
end

function isAuthEMS(job)
    for i = 1, #teamCloud["EMSJob"] do
        if job == teamCloud["EMSJob"][i] then
            return true
        end
    end
    return false
end

if teamCloud.Framework == "qb" or teamCloud.Framework == "oldqb" then
    QBCore.Functions.CreateCallback('deniz-dispatch:sv:sendNotify', function(source, cb, data, jobType)
        for idx, id in pairs(QBCore.Functions.GetPlayers()) do
            local xPlayer = QBCore.Functions.GetPlayer(id)
            if jobType == 'pd' and isAuthPD(xPlayer.PlayerData.job.name) then
                TriggerClientEvent('deniz-dispatch:cl:sendNotify', xPlayer.PlayerData.source, data)
                TriggerClientEvent("deniz-dispatch:createBlip", xPlayer.PlayerData.source, data.blipName, data.location)
            elseif jobType == 'ems' and isAuthEMS(xPlayer.PlayerData.job.name) then
                TriggerClientEvent('deniz-dispatch:cl:sendNotify', xPlayer.PlayerData.source, data)
                TriggerClientEvent("deniz-dispatch:createBlip", xPlayer.PlayerData.source, data.blipName, data.location)
            elseif jobType == 'both' and isAuthPD(xPlayer.PlayerData.job.name) or isAuthEMS(xPlayer.PlayerData.job.name) then
                TriggerClientEvent('deniz-dispatch:cl:sendNotify', xPlayer.PlayerData.source, data)
                TriggerClientEvent("deniz-dispatch:createBlip", xPlayer.PlayerData.source, data.blipName, data.location)
            end
        end
        cb(true)
    end)
elseif teamCloud.Framework == 'esx' then
    ESX.RegisterServerCallback('deniz-dispatch:sv:sendNotify', function(source, cb, data, jobType)
        for idx, id in pairs(ESX.GetPlayers()) do
            local xPlayer = ESX.GetPlayerFromId(id)
            if jobType == 'pd' and isAuthPD(xPlayer.job.name) then
                TriggerClientEvent('deniz-dispatch:cl:sendNotify', xPlayer.source, data)
                TriggerClientEvent("deniz-dispatch:createBlip", xPlayer.source, data.blipName, data.location)
            elseif jobType == 'ems' and isAuthEMS(xPlayer.job.name) then
                TriggerClientEvent('deniz-dispatch:cl:sendNotify', xPlayer.source, data)
                TriggerClientEvent("deniz-dispatch:createBlip", xPlayer.source, data.blipName, data.location)
            elseif jobType == 'both' and isAuthPD(xPlayer.job.name) or isAuthEMS(xPlayer.job.name) then
                TriggerClientEvent('deniz-dispatch:cl:sendNotify', xPlayer.source, data)
                TriggerClientEvent("deniz-dispatch:createBlip", xPlayer.source, data.blipName, data.location)
            end
        end
        cb(true)
    end)
end