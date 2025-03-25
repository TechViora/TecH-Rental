████████╗███████╗░█████╗░██╗░░██╗
╚══██╔══╝██╔════╝██╔══██╗██║░░██║
░░░██║░░░█████╗░░██║░░╚═╝███████║
░░░██║░░░██╔══╝░░██║░░██╗██╔══██║
░░░██║░░░███████╗╚█████╔╝██║░░██║
░░░╚═╝░░░╚══════╝░╚════╝░╚═╝░░╚═╝

local QBCore = exports['qb-core']:GetCoreObject()

cd = Config.Cooldown
local rentad = false
local rentedVehicle = nil
local rentTimer = nil

RegisterNetEvent("carrentmenu:open", function()
    local g = {
        {
            header = "Araç Kirala",
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.carlist) do
        g[#g+1] = {
            header = v.label,
            txt = v.label .. ' ' .. " Fiyat: ".."₺".." " .. v.price .. "".. " ",
            params = {
                isServer = false,
                event = "ASDASD",
                args = {
                    label = v.label,
                    model = v.model,
                    price = v.price
                }
            }
        }
    end
    g[#g+1] = {
        header = "⬅ Geri Dön",
    }
    exports['qb-menu']:openMenu(g)
end)

RegisterNetEvent('rentmenunpc', function()
    if rentad then
        QBCore.Functions.Notify('Zaten bir araba kiraladınız', 'error', 3500)
    else
        TriggerEvent('carrentmenu:open')
    end
end)

RegisterNetEvent('ASDASD', function(data)
    local model = data.model
    local price = data.price
    QBCore.Functions.TriggerCallback('checkbankmoney', function(cb)
        if cb < price then
            QBCore.Functions.Notify('Yeterli paran yok.', 'error', 3500)
        else
            TriggerServerEvent('buyvehicle:server', price)
            QBCore.Functions.Notify('Bir araba kiraladın '..' $'..price, 'success', 3500)

            rentad = true
            local ped = PlayerPedId()
            vehiclehash = data.model
            RequestModel(vehiclehash)
            while not HasModelLoaded(vehiclehash) do
                Wait(10)
            end

            rentedVehicle = CreateVehicle(vehiclehash, vector3(Config.Coords.x, Config.Coords.y, Config.Coords.z), Config.Coords.h, true, false)
            TaskWarpPedIntoVehicle(ped, rentedVehicle, -1)
            SetModelAsNoLongerNeeded(rentedVehicle)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(rentedVehicle))

            -- Araçtan inme kontrolü KAFKAS
            Citizen.CreateThread(function()
                while rentad do
                    Wait(500)
                    if not IsPedInVehicle(ped, rentedVehicle, false) then
                        if not rentTimer then
                            rentTimer = GetGameTimer() 
                            Citizen.CreateThread(function()
                                while rentTimer and rentad do
                                    local remainingTime = 60 - math.floor((GetGameTimer() - rentTimer) / 1000)
                                    QBCore.Functions.Notify('Kiralanan aracın garaja çekilmesine kalan süre: ' .. remainingTime .. ' saniye', 'warning', 1000)
                                    Wait(1000) -- 
                                end
                            end)
                        elseif GetGameTimer() - rentTimer >= 60000 then -- 10 saniye bekle
                            DeleteVehicle(rentedVehicle) -- Araç sil
                            QBCore.Functions.Notify('Araç silindi.', 'error', 3500)
                            rentad = false
                            rentTimer = nil
                            break
                        end
                    else
                        rentTimer = nil 
                    end
                end
            end)
        end
    end)
end)


