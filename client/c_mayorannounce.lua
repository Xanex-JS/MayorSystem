--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

--  Don't Touch below

local isMayor = false
local isAllowedToUse = false

if Config.PermissionSys == "Discord" then
Citizen.CreateThread(function()
    TriggerServerEvent("MayorSystem.getIsAllowed")
end)
end

RegisterNetEvent("MayorSystem.returnIsAllowed")
AddEventHandler("MayorSystem.returnIsAllowed", function(isAllowed)
    isMayor = isAllowed
end)

-- Ace Permissions

if Config.PermissionSys == "Ace" then
Citizen.CreateThread(function()
    TriggerServerEvent("MayorSystem.getIsAllowedMayor")
end)
end

RegisterNetEvent("MayorSystem.returnIsAllowedMayor")
AddEventHandler("MayorSystem.returnIsAllowedMayor", function(isAllowedMayor)
    isAllowedToUse = isAllowedMayor
end)

-- Announce Command

RegisterCommand(Config.Announce, function(source, args)
  local message = table.concat(args, " ")

    if Config.UsePerms == 1 then
    if Config.PermissionSys == "Discord" then
    if isMayor then -- Check the source's permissions
    TriggerServerEvent("mayorannounce", message)
    else
            sendMsg("^1You're not the mayor :/")
    end
  end
end

    if Config.PermissionSys == "Ace" and Config.UsePerms == 1 then
          if isAllowedToUse then
                TriggerServerEvent("mayorannounce", table.concat(args, " "))
              else
                    sendMsg("^1You're not the mayor LOL")
    end

    -- If Permissions have been disabled we will run the code below

    elseif Config.UsePerms == 2 then
        TriggerServerEvent("mayorannounce", table.concat(args, " "))
    end

end)