--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

-- Announcement Server Register

RegisterServerEvent("mayorannounce")
AddEventHandler("mayorannounce", function(param)
    TriggerClientEvent("chatMessage", -1, "^1[Mayor Announcement]^2", {0,0,0}, param)
end)
