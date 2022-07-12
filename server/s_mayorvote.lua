--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]


voteOptions = {}
voteNames = {}
voteInProgress = false
numChoices = 0;
RegisterCommand('startMayorVote', function(source, args, rawCommand)
    if MayorVote then 
	if IsPlayerAceAllowed(source, "StartMayorVote") then 
		if not voteInProgress then 
			voteOptions = {}
			voteNames = {}
			numChoices = 0;
			votedAlready = {}
			if #args > 2 then 
				if tonumber(args[1]) ~= nil then 
					local secs = tonumber(args[1]);
					voteInProgress = true;
					TriggerClientEvent('chatMessage', -1, Config.prefix .. '^3[MayorSystem] A Mayor vote has been started... You have ^1' 
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
						'^3[MayorSystem] A New Mayor has been decided ^1' .. highestVoteName .. ' is the new mayor ', ' ^3with a total of ^1' .. highestVoteCount .. ' ^3votes')
					voteInProgress = false;
				else 
					sendMsg(source, '^1[MayorSystem] That is not a valid number...')
				end
			else 
				sendMsg(source, '^1[MayorSystem] You need at least 2 choices... /vote <seconds> <name1> <name2>')
			end
		end
	end
end
end)

function sendMsg(src, msg) 
	TriggerClientEvent('chatMessage', src, prefix .. msg);
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
RegisterCommand('vote', function(source, args, rawCommand)
	if voteInProgress then 
		if not has_value(votedAlready, source) then 
			if #args > 0 then 
				if tonumber(args[1]) ~= nil then
					voteOptions[tonumber(args[1])] = voteOptions[tonumber(args[1])] + 1;
					sendMsg(source, '^2Thank you for voting!, it has been submitted.')
					table.insert(votedAlready, source);
				else 
					sendMsg(source, '^1[MayorSystem] Must be a valid Number')
				end
			else
				sendMsg(source, '^1[MayorSystem] You need to do /vote <num>')
			end
		else 
			sendMsg(source, '^1[MayorSystem] You Already voted lol')
		end
	else 
		sendMsg(source, '^1[MayorSystem] There is currently no vote in progress :(')
	end
end)