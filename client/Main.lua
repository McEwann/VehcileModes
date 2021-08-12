
local pursuitmode = false -- Toggle
local vehicle = GetVehiclePedIsIn(player)


--Get Hash of mustang / pursuit vehicle
-- Add more by using the same method and updating the function at the bottom with "or IsVehicleModel(vehicle, *newhasname_hash*)"
local Interceptor_hash = GetHashKey("2015polstang")



--Start Thread
Citizen.CreateThread(function()
while true do
    Citizen.Wait(0)

    if IsDisabledControlPressed (1, 36) and IsControlJustPressed(1, vehmode_key) and IsPlayerInInterceptor() then  --Toggle mode current CTRL + Up Arrow
        pursuitmode = not pursuitmode
            if pursuitmode then
				TriggerEvent("chatMessage", 'Vehicle Mode: Pursuit')
                while pursuitmode do
                    Citizen.Wait(0)
                    --Vehicle modifiers must be looped every tick
                    SetVehicleEnginePowerMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.5)
                    SetVehicleEngineTorqueMultiplier(GetVehiclePedIsIn(GetPlayerPed(-1), true), 1.5)
                    
                    --Break Loop condition (keypress exit)
                    if  IsDisabledControlPressed (1,36) and IsControlJustPressed(1, 173) or IsPedOnFoot(PlayerPedId()) then -- Exit on keypress current CRTL + Down Arrow
                        TriggerEvent("chatMessage", 'Vehicle Mode: Patrol')
                        pursuitmode = false 
                        
                    end
                end
            end
		end
	end	
end) --End Thread





-- Functions
function IsPlayerInInterceptor()
	local lPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(lPed)
	return IsVehicleModel(vehicle, Interceptor_hash)
end

