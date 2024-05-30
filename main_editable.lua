RegisterNetEvent("deniz-dispatch:createBlip", function(type, coords)
    if type == "gunshot" then
        local alpha = 477
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 110)
        SetBlipColour(Blip, 3)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Ateş İhbarı')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == 'banktruck' then
        local alpha = 477
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 161)
        SetBlipColour(Blip, 46)
        SetBlipScale(Blip, 1.5)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Banka Aracı Soygunu')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "dead1" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 153)
        SetBlipColour(Blip, 1)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Yaralı Vatandaş')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "dead2" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 153)
        SetBlipColour(Blip, 76)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Yaralı Memur')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "dead3" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 153)
        SetBlipColour(Blip, 76)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Acil Yaralı Memur')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "dead4" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 153)
        SetBlipColour(Blip, 76)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Yaralı Doktor')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "araccalma" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 225)
        SetBlipColour(Blip, 76)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Araç Hırsızlığı')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "fleeca" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 375)
        SetBlipColour(Blip, 76)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Fleeca Soygunu')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "vezne" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 375)
        SetBlipColour(Blip, 76)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Vezne Soygunu')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "market" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 59)
        SetBlipColour(Blip, 76)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Market Soygunu')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    elseif type == "ev" then
        local alpha = 150
        local Blip = AddBlipForCoord(coords)
        SetBlipSprite(Blip, 40)
        SetBlipColour(Blip, 76)
        SetBlipScale(Blip, 1.0)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('(İhbar) Ev Soygunu')
        EndTextCommandSetBlipName(Blip)
        while alpha ~= 0 do
            Citizen.Wait(120 * 4)
            alpha = alpha - 1
            SetBlipAlpha(Blip, alpha)
            if alpha == 0 then
                RemoveBlip(Blip)
                return
            end
        end
    end
end)