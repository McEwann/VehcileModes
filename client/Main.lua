
local pursuitmode = true -- Toggle
local toggle = 118 -- Numpad 9
local vehicle = GetVehiclePedIsIn(player)
local Interceptor_hash = GetHashKey("2015polstang")--Get Hash of mustang / pursuit vehicle

Citizen.CreateThread(function()
while true do
Citizen.Wait(0)
    if IsControlJustPressed(1, 118) and IsPlayerInInterceptor() then
        pursuitmode = not pursuitmode
            if pursuitmode then
				TriggerEvent("chatMessage", 'Pursuit Mode')
                while pursuitmode do
                    Citizen.Wait(0)
                    --Vehicle modifiers must be looped every tick
                    SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.5)
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.5)
                    --Break Loop
                    if IsControlJustPressed(1, 118) then
                        TriggerEvent("chatMessage", 'Patrol Mode')
                        pursuitmode = false 
                    end
                end
			else
				TriggerEvent("chatMessage", 'Normal')
            end
		end
	end	
end)

-- Functions
function IsPlayerInInterceptor()
	local lPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(lPed)
	return IsVehicleModel(vehicle, Interceptor_hash)
end
