
local pursuitmode = true -- on/off speed
local toggle = 118 -- Numpad 9
local vehicle = GetVehiclePedIsIn(player)
local Interceptor_hash = GetHashKey("2015polstang")


-- Thread
Citizen.CreateThread(function()


	while true do
    Citizen.Wait(0)
    if IsControlJustPressed(1, 118) and IsPlayerInInterceptor() then
        pursuitmode = not pursitmode

			if pursuitmode then
				TriggerEvent("chatMessage", 'persuit mode')
                while pursuitmode do
                    Citizen.Wait(0)
                    
                    SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 20.0)
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 20.0)
                    print("weewoo")

                    if IsControlJustPressed(1, 118) then
                        TriggerEvent("chatMessage", 'Normal')
                        pursuitmode = false 
                    end
                end
			else
				TriggerEvent("chatMessage", 'Normal')
                SetVehicleCheatPowerIncrease(GetVehiclePedIsIn(ped, false), 1)

            end
		end
	end	
end)

-- Function
function IsPlayerInInterceptor()
	local lPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(lPed)
	return IsVehicleModel(vehicle, Interceptor_hash)
end
