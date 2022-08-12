QBCore = exports['qb-core']:GetCoreObject()
local lockdownyes = false

---------------- / Mayor System ----------------
RegisterNetEvent('qb-mayor:server:trigger:lockdown')
AddEventHandler('qb-mayor:server:trigger:lockdown', function()
    TriggerClientEvent('MayorQBCore', -1)
end)

RegisterNetEvent('qb-mayor:server:trigger:announcementnormal')
AddEventHandler('qb-mayor:server:trigger:announcementnormal', function(result)
    exports["MayorSystem_QBCore"]:SendAlertToDisplay(result)
end)

RegisterNetEvent('qb-mayor:server:trigger:announcementemerg')
AddEventHandler('qb-mayor:server:trigger:announcementemerg', function(result)
    exports["MayorSystem_QBCore"]:SendAlertToDisplayEmerg(result)
end)

QBCore.Functions.CreateUseableItem("mayorsystem", function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "mayor" then
    TriggerClientEvent('qb-mayor:open:menu', source)
    else
        TriggerClientEvent('QBCore:Notify', source,  "Only the mayor job can use this", "error")
    end
end)
---------------- / Mayor System ----------------

-- Job and Other shit

--[[

        ['mayor'] = {
		label = 'Mayors Workers',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Mayor Secruity',
                payment = 100
            },
            ['1'] = {
                name = 'Mayor Bodyguard',
                payment = 150
            },
            ['2'] = {
                name = 'Mayors Assistant',
                payment = 200
            },
            ['3'] = {
                name = 'Mayor',
                isboss = true,
                payment = 350
            },
        },
	},

    ["mayorsystem"] 					 = {["name"] = "mayorsystem", 			  			["label"] = "Mayor Laptop", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "laptop.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "This Laptop does unspeakable things :/ :3"},

]]