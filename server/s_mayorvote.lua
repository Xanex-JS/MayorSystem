--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]
------------------ Mayor System Voting Stuff ----------------
local QBCore = exports['qb-core']:GetCoreObject()

-- end of spawn ped

-- get count to multiply

RegisterNetEvent('qb-mayor:vote:save:database')
AddEventHandler('qb-mayor:vote:save:database', function(Canidate1)
	local count = '0'

	local discord = ""
	local id = ""

	identifiers = GetNumPlayerIdentifiers(Canidate1)
	for i = 0, identifiers + 1 do
		if GetPlayerIdentifier(Canidate1, i) ~= nil then
			if string.match(GetPlayerIdentifier(Canidate1, i), "discord") then
				discord = GetPlayerIdentifier(Canidate1, i)
				id = string.sub(discord, 9, -1)
			end
		end
	end

	MySQL.Sync.fetchAll("INSERT INTO `mayorvote` (Votecount, CharacterName, DiscordUID) VALUES (@count, @Canidate1, @DiscordUID)",

	{
		['@count'] = count,
		['@Canidate1'] = GetPlayerName(Canidate1),
		['@DiscordUID'] = "<@" .. id .. ">"
	})

end)
RegisterNetEvent('qb-menu:vote:menu:server:input', function(data)
	 MySQL.Sync.fetchAll("UPDATE mayorvote SET voteCount = voteCount + 1 WHERE CharacterName = @CharacterName",
	 {
		 ['@CharacterName'] = data.voted
	 })
	
end)

QBCore.Functions.CreateCallback('CheckCandidates', function(result, cb)
	local result = MySQL.Sync.fetchAll('SELECT * FROM mayorvote')
		print("[QBCore Mayor] Server Callback Database Check")
			cb(result)
end)

------------------ Mayor System Voting Stuff ----------------

QBCore.Commands.Add('checkvote', 'Check votes for a mayor canidate', {}, false, function(source)

	-- Lets fetch from the database and use them arguments

    local result = MySQL.Sync.fetchAll('SELECT * FROM mayorvote')
    
    local menu = {
        {
            header = "Candidates",
            isMenuHeader = true
        }
    }

    for k, v in pairs(result) do
        menu[#menu+1] = {
            header = v.CharacterName,
            txt = 'Votes: '..v.Votecount,
        }
    end

    TriggerClientEvent('qb-menu:client:openMenu', source, menu)

end)
