# AussieDropBear MayorSystem

# Installtion 

1. Drag and drop `MayorSystem_QBCore`, add `ensure MayorSystem_QBCore` to your server.cfg or resources.cfg-- This must stay this name.
2. Add the jobs to your jobs.lua in qb-core/shared/jobs.lua
3. Add the item below to your qb-core/shared/items.lua
4. Execute the mayorsystem.sql to your database as a query
5. config the config file to suit your needs.
6. Bobs ya uncle.

# PS

Commands: ``/checkvotes`` -- lets you check the votes otherwise use the ped.
'Consume' the laptop to open the mayor dedicated menu 

# Notes

https://discord.gg/dJbZHS4r -- Join My discord if you need support.
This system only works with QBCore!!!!!

# QB-CORE Add

qb-core/shared/jobs.lua
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

qb-core/shared/items.lua

 ["mayorsystem"] 					 = {["name"] = "mayorsystem", 			  			["label"] = "Mayor Laptop", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "laptop.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   ["combinable"] = nil,   ["description"] = "This Laptop does unspeakable things :/ :3"},
