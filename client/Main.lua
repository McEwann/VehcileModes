
local pursuitmode = false -- Toggle
local vehmode_key = 172  -- Numpad 9
local vehicle = GetVehiclePedIsIn(player)
local Interceptor_hash = GetHashKey("2015polstang")--Get Hash of mustang / pursuit vehicle

Citizen.CreateThread(function()
while true do
Citizen.Wait(0)

    if IsDisabledControlPressed (1, 36) and IsControlJustPressed(1, vehmode_key) and IsPlayerInInterceptor() then
        pursuitmode = not pursuitmode
            if pursuitmode then
				TriggerEvent("chatMessage", 'Vehicle Mode: Pursuit')
                while pursuitmode do
                    Citizen.Wait(0)
                    --Vehicle modifiers must be looped every tick
                    SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.5)
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.5)
                    
                    --Break Loop
                    if  IsDisabledControlPressed (1,36) and IsControlJustPressed(1, 173) or IsPedOnFoot(PlayerPedId()) then
                        TriggerEvent("chatMessage", 'Vehicle Mode: Patrol')
                        pursuitmode = false 
                        
                    end
                end
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

