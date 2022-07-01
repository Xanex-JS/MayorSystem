--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

-- Discord checks if they have permissions to use the lockdown command


--  Values Don't Touch
local isLockdown = false
local Lockdown = false
local isAllowedToUseLockdown = false
local isAllowedToUseLockdownAce = false
local ActiveLockdown = false

RegisterCommand(Config.Command, function(source, args)
  local Ped = GetPlayerPed(-1)
  local name = GetPlayerName(-1)
  --  Lockdown Checking
      isLockdown = not isLockdown

      -- Permission checking for Discord Permissions.
      if Config.PermissionSys == "Discord" and Config.UsePerms == 1 then
            if isAllowedToUseLockdown then
              if isLockdown == true then
                      Lockdown = true
                      isLockdown = true
                      -- TriggerServerEvent("Server:SoundToAll", "demo", 1.0);
                      TriggerServerEvent("LoggingLockdown")
                      sendMsg("~g~Lockdown has been activiated")
                    elseif isAllowedToUseLockdown and not isLockdown then
                      Lockdown = false
                      isLockdown = false
                      sendMsg("~g~Lockdown has been lifted")
                else
                      sendMsg("^1You're not the mayor")
                end
        end
end

  -- Ace Permission Checks

      if Config.PermissionSys == "Ace" and Config.UsePerms == 1 then
            if isAllowedToUseLockdownAce then
              if isLockdown == true then
                      Lockdown = true
                      isLockdown = true
                      TriggerServerEvent("Server:SoundToAll", "demo", 1.0);
                      sendMsg("~g~Lockdown has been activiated")
                    elseif isAllowedToUseLockdownAce and not isLockdown then
                      Lockdown = false
                      isLockdown = false
                      sendMsg("~g~Lockdown has been lifted")
                else
                      sendMsg("^1You're not the mayor")
          end
end

    -- If Permissions have been disabled we will run the code below

    -- if you have disabled perms the below code will be used
    elseif Config.UsePerms == 2 then
        if isLockdown == true then
          Lockdown = true
          isLockdown = true
                      TriggerServerEvent("Server:SoundToAll", "demo", 1.0);
            sendMsg("~g~Lockdown has been activiated")
        elseif not isLockdown then
          Lockdown = false
          isLockdown = false
            sendMsg("~g~Lockdown has been lifted")
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"Goverment", "State Lockdown has been lifted by the mayors office.", -1}
              })
            end
end
end)

-- Threads and functions this scripts uses
-- Don't touch anything below here unless you know what you're doing...

Citizen.CreateThread(function()
	while true do
		Wait(0);
		local Ped = GetPlayerPed(-1);
		if CurrentlyLockdown() then
			Draw2DText(0.090, 0.672, "The Mayor has initiated a lockdown.", 0.5, 1);
			Draw2DText(0.110, 0.700, "If You're found outside you will be arrested.", 0.5, 1);
      Draw2DText(0.102, 0.732, "All Residents are urged to remain inside.", 0.5, 1);
        end
    end
end)

function CurrentlyLockdown()
    if Lockdown then
    return true
    else
    return false
    end
end

if Config.PermissionSys == "Discord" then
Citizen.CreateThread(function()
    TriggerServerEvent("MayorSystem.getIsAllowed")
end)
end

RegisterNetEvent("MayorSystem.returnIsAllowed")
AddEventHandler("MayorSystem.returnIsAllowed", function(isAllowed)
    isAllowedToUseLockdown = isAllowed
end)

if Config.PermissionSys == "Ace" then
  Citizen.CreateThread(function()
      TriggerServerEvent("MayorSystem.getIsAllowedMayor")
end)
end

RegisterNetEvent("MayorSystem.returnIsAllowedMayor")
AddEventHandler("MayorSystem.returnIsAllowedMayor", function(isAllowedMayor)
    isAllowedToUseLockdownAce = isAllowedMayor
end)
