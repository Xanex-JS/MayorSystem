--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]


voteOptions = {}
voteNames = {}
voteInProgress = false
numChoices = 0;
RegisterCommand(Config.VoteStartCommand, function(source, args, rawCommand)
    -- if MayorVote then
	local src = source
	  if IsPlayerAceAllowed(src, Config.StartVotePermission) then
		if not voteInProgress then
			voteOptions = {}
			voteNames = {}
			numChoices = 0;
			votedAlready = {}
			if #args > 2 then
				if tonumber(args[1]) ~= nil then
					local secs = tonumber(args[1]);
					voteInProgress = true;
					TriggerClientEvent('chatMessage', -1, Config.prefix .. '^3 A Mayor vote has been started... You have ^1'
						.. args[1] .. ' ^3seconds to vote for the new Mayor')
					for i=2, #args do
						TriggerClientEvent('chatMessage', -1, '^6[^7' .. args[i] .. '^6]^3: /vote ' .. (i - 1))
						numChoices = numChoices + 1;
						voteOptions[(i - 1)] = 0;
						voteNames[(i - 1)] = args[i];
					end
					Wait(secs * 1000);
					local highestVoteCount = voteOptions[1]
					local highestVoteName = voteNames[1]
					for i=1, numChoices do
						if voteOptions[i] > highestVoteCount then
							highestVoteCount = voteOptions[i]
							highestVoteName = voteNames[i]
						end
					end
					TriggerClientEvent('chatMessage', -1, Config.prefix ..
						'^3 A New Mayor has been decided ^1' .. highestVoteName .. ' is the new mayor ', ' ^3with a total of ^1' .. highestVoteCount .. ' ^3votes')
					voteInProgress = false;
				else
					sendMsg(source, '^1 That is not a valid number...')
				end
			else
				sendMsg(source, '^1 You need at least 2 choices... /vote <seconds> <name1> <name2>')
			end
		end
	 end
-- end
end)

function sendMsg(src, msg)
	TriggerClientEvent('chatMessage', src, Config.prefix .. msg);
end
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

votedAlready = {}
RegisterCommand(Config.VoteCommand, function(source, args, rawCommand)
	if voteInProgress then
		if not has_value(votedAlready, source) then
			if #args > 0 then
				if tonumber(args[1]) ~= nil then
					voteOptions[tonumber(args[1])] = voteOptions[tonumber(args[1])] + 1;
					sendMsg(source, '^2 Thank you for voting!, it has been submitted.')
					table.insert(votedAlready, source);
				else
					sendMsg(source, '^1 Must be a valid Number')
				end
			else
				sendMsg(source, '^1 You need to do /vote <num>')
			end
		else
			sendMsg(source, '^1 You Already voted lol')
		end
	else
		sendMsg(source, '^1 There is currently no vote in progress :(')
	end
end)
-- Force a person to be the mayor
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

	if IsPlayerAceAllowed(src, Config.StartVotePermission) then

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

	else
		sendMsg(src, '^1 You do not have permission to use this command')
	end

-- Database start

	MySQL.Sync.fetchAll("INSERT INTO `mayorsystem` (ID, SteamName) VALUES (@source, @name)",

	{
        ['@source'] = GetPlayerIdentifiers(source)[4],
        ['@name'] = GetPlayerName(source)
    })

	-- database end

end)