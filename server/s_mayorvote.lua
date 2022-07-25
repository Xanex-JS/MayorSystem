--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]
------------------ Mayor System Voting Stuff ----------------



------------------ Mayor System Voting Stuff ----------------


------------------ Mayor System ----------------
RegisterCommand(Config.GiveMayor, function(source, args)
	local src = source

	local messageContent = "\n- New Mayor: " .. GetPlayerName(args[1]) .. ""

	local discord = ""
	local id = ""

	identifiers = GetNumPlayerIdentifiers(source)
	for i = 0, identifiers + 1 do
		if GetPlayerIdentifier(source, i) ~= nil then
			if string.match(GetPlayerIdentifier(source, i), "discord") then
				discord = GetPlayerIdentifier(source, i)
				id = string.sub(discord, 9, -1)
			end
		end
	end

		if #args < 1 then
			sendMsg(src, '^3 You need to specify a serverID')
		end

		if #args > 0 then

			-- Lets run some code to get their UID and advertise who the new mayor is

			sendMsg(-1, '^3 ' .. GetPlayerName(src) .. ' Has Made ' .. GetPlayerName(args[1]) .. ' The New Mayor')
			TriggerClientEvent('chatMessage', src, Config.prefix .. '^3' .. GetPlayerName(args[1]) .. ' DiscordUID: ' .. id)	

			-- Lets alert the new mayor aswell

			TriggerClientEvent('chatMessage', args[1], Config.prefix .. '^3 You have been made the new Mayor')

			--  lets alert discord 

			sendToDiscord(16753920, "MayorSystem" .. "" .. messageContent)

		end

-- Database start

	-- database end

    local src = source
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end
	
    if identifierDiscord then

		MySQL.Sync.fetchAll("INSERT INTO `mayorsystem` (DiscordUID, FiveMName) VALUES (@source, @name)",

		{
			['@source'] = "<@"..id .. ">",
			['@name'] = GetPlayerName(source)
		})
		
			print("Discord UID Found")

		else

            print('No Discord UID found')

		end

end)