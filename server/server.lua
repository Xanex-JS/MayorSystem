--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]


-- Permission Checking....

RegisterServerEvent("MayorSystem.getIsAllowed")
AddEventHandler("MayorSystem.getIsAllowed", function()
    local src = source
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end
    if identifierDiscord then
		local roleIDs = exports.Badger_Discord_API:GetDiscordRoles(src)
		if not (roleIDs == false) then
			for i = 1, #roleIDs do
				for j = 1, #roleList do
					if exports.Badger_Discord_API:CheckEqual(roleList[j], roleIDs[i]) then
              TriggerClientEvent("MayorSystem.returnIsAllowed", src, true)
					end
				end
			end
		else
			--
            TriggerClientEvent("MayorSystem.returnIsAllowed", src, false)
		end
    elseif identifierDiscord == nil then
		print("identifierDiscord == nil")
    end
	-- Add a event if no discord Identifier is found if you really want...
    -- Such as kicking the user IDK why you would do that though...
end)

-- Check Ace PermissionSys

RegisterServerEvent("MayorSystem.getIsAllowedMayor")
AddEventHandler("MayorSystem.getIsAllowedMayor", function()
    local src = source
        if IsPlayerAceAllowed(src, Config.AcePermissionsGroup) then
              TriggerClientEvent("MayorSystem.returnIsAllowedMayor", src, true)
		else
      TriggerClientEvent("MayorSystem.returnIsAllowedMayor", src, false)
    end
end)
