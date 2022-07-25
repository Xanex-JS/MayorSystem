--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

--  Don't Touch below

local isMayor = false

-- Announce Command

RegisterNetEvent('MayorQBCoreAnnouncement')
AddEventHandler('MayorQBCoreAnnouncement', function()
  local message = table.concat(args, " ")

    TriggerServerEvent("mayorannounce", message)

end)