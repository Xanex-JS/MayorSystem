--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]
--  Values Don't Touch

local isLockdown = false
local Lockdown = false
local ActiveLockdown = false

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('MayorQBCore')
AddEventHandler('MayorQBCore', function()

    isLockdown = not isLockdown

            if isLockdown == true then
                    Lockdown = true
                    isLockdown = true
                    -- TriggerServerEvent("Server:SoundToAll", "demo", 1.0);
                    TriggerServerEvent("LoggingLockdown")
                    sendMsg("~g~Lockdown has been activiated")
                    TriggerEvent('mayorlockdown:server:loadbar')
                  elseif not isLockdown then
                    Lockdown = false
                    isLockdown = false
                    sendMsg("~g~Lockdown has been lifted")
end

end)

-- Threads and functions this scripts uses
-- Don't touch anything below here unless you know what you're doing...

Citizen.CreateThread(function()
	while true do
		Wait(0);
		local Ped = GetPlayerPed(-1);
		if CurrentlyLockdown() then
			Draw2DText(0.300, 0.030, "The Mayor has initiated a lockdown.", 0.5, 1);
			Draw2DText(0.470, 0.030, "If You're found outside you will be arrested.", 0.5, 1);
            Draw2DText(0.650, 0.030, "All Residents are urged to remain inside.", 0.5, 1);
        end
    end
end)

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )

	return result
end

function Draw2DText(x, y, text, scale)
    -- Draws the text on screen and does fancy stuff
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    local rainbow = RGBRainbow( 1 )
		SetTextColour( rainbow.r, rainbow.g, rainbow.b, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextJustification(0)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function CurrentlyLockdown()
    if Lockdown then
    return true
    else
    return false
    end
end