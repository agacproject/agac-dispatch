if teamCloud.Framework == "esx" then
    ESX = nil
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj)
                ESX = obj
            end)
            Citizen.Wait(0)
        end
    end)
elseif teamCloud.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif teamCloud.Framework == "oldqb" then
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
end

local menuStatus = false
local dispatchLocations = {}

RegisterCommand('dispatch:test', function()
    functionData = {
        code = '11-71',
        id = math.random(1, 9)..math.random(1, 9)..math.random(1, 9)..math.random(1, 9)..math.random(1, 9)..math.random(1, 9)..'DENIZ',
        location = GetEntityCoords(PlayerPedId()),
        blipName = 'gunshots',
        pieces = {
            {
                header = 'Olay Bilgisi',
                text = 'Ateş İhbarı',
            },
            {
                header = 'Konum',
                text = getStreetIndex(),
            },
        }
    }
    TriggerEvent('deniz-dispatch:dispatch', functionData, 'both')
end)

RegisterNetEvent('deniz-dispatch:dispatch', function(data, dtype)
    if data ~= nil and dtype ~= nil then
        if teamCloud.Framework == "qb" or teamCloud.Framework == "oldqb" then
            QBCore.Functions.TriggerCallback('deniz-dispatch:sv:sendNotify', function(result) end, data, dtype)
        elseif teamCloud.Framework == 'esx' then
            ESX.TriggerServerCallback('deniz-dispatch:sv:sendNotify', function(result) end, data, dtype)
        end
    end
end)

RegisterNetEvent('deniz-dispatch:cl:sendNotify', function(argsData)
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    locationData = {
        id = argsData.id,
        location = argsData.location
    }
    table.insert(dispatchLocations, locationData)
    SendNUIMessage({
        type = 'sendDispatch',
        data = argsData
    })
end)

RegisterNuiCallback('dispatch:nui:setWaypoint', function(data)
    for _,v in pairs(dispatchLocations) do
        if v.id == data.id then
            SetNewWaypoint(v.location.x, v.location.y)
            waypointMessage()
            break
        end
    end
end)

function getStreetIndex()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    local area = GetLabelText(tostring(GetNameOfZone(coords.x, coords.y, coords.z)))
    local playerStreetsLocation = area
    if not zone then zone = teamCloud.UnknownArea end
    if currentStreetName ~= nil and currentStreetName ~= "" then playerStreetsLocation = currentStreetName .. ", " ..area
    else playerStreetsLocation = area end
    return playerStreetsLocation
end
exports('GetStreetIndex', GetStreetIndex)

RegisterKeyMapping('+dispatchMenu', 'Dispatch Menu (PD)', 'keyboard', teamCloud.DispatchMenuKey)
RegisterCommand('+dispatchMenu', function()
    if menuStatus == false and QBCore.Functions.GetPlayerData().job.name == "police" then
        menuStatus = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = 'openMenu'
        })
    end
end)

RegisterNuiCallback('dispatch:nui:closeESC', function()
    menuStatus = false
    SetNuiFocus(false, false)
end)

Citizen.CreateThread(function()
    local cooldown = 0
    local isBusy = false
	while true do
		Citizen.Wait(0)
        local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		avcilikicinde = false
        if not avcilikicinde then
            if IsPedShooting(playerPed) and (cooldown == 0 or cooldown - GetGameTimer() < 0) and not isBusy then
                if QBCore.Functions.GetPlayerData().job.name == "police" or QBCore.Functions.GetPlayerData().job.name == "statepolice" or QBCore.Functions.GetPlayerData().job.name == "sheriff" or QBCore.Functions.GetPlayerData().job.name == "ranger" then
                    isBusy = false
                    -- cooldown = GetGameTimer() + math.random(6000, 10000)
                    -- TriggerEvent("deniz-dispatch:gunshot")
                else
                    isBusy = true
                    if IsPedCurrentWeaponSilenced(playerPed) then
                        cooldown = GetGameTimer() + math.random(25000, 30000)
                    else
                        cooldown = GetGameTimer() + math.random(6000, 10000)
                    end
                    functionData = {
                        code = '11-71',
                        id = math.random(1, 9)..math.random(1, 9)..math.random(1, 9)..math.random(1, 9)..math.random(1, 9)..math.random(1, 9)..'DENIZ',
                        location = GetEntityCoords(PlayerPedId()),
                        blipName = 'gunshot',
                        pieces = {
                            {
                                header = 'Olay Bilgisi',
                                text = 'Ateş İhbarı',
                            },
                            {
                                header = 'Konum',
                                text = getStreetIndex(),
                            },
                        }
                    }
                    TriggerEvent('deniz-dispatch:dispatch', functionData, 'pd')
                    isBusy = false
                end
            end
        end
    end
end)