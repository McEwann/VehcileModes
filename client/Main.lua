--Client File
--Author McEewan

--Config
local toggle_chasemode = 97 -- Toggle interceptor mode



--Start
local vehicle_hash = GetHashKey("2015polstang")
local chasemode = false


Citizen.CreateThread(funtion()
While true do

    
        if IsControlJustPressed(0, toggle_chasemode) then -- Toggle multipliers
            chasemode = true
        end
    end
        
        
end)

if chasemode then
    SetVehicleCheatPowerIncrease(vehicle_hash, 200)
    
end
function IsPlayerInMustang()
	local lPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(lPed)
	return IsVehicleModel(vehicle, vehicle_hash)
end