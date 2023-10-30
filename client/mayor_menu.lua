QBCore = exports['qb-core']:GetCoreObject()

-- Event to trigger the menu 

RegisterNetEvent('qb-mayor:open:menu', function()
    local MayorMenu = {
        {
            isMenuHeader = true,
            header = "Mayor Menu"
        },
        {
            header = "Trigger Lockdown",
            txt = "Trigger Lockdown",
            params = {
                event = 'qb-mayor:client:trigger:lockdown',
            }
        },
        {
            header = "Mayor Announcements",
            txt = "Open up mayor announcements sub menu",
            -- disabled = true,
            params = {
                event = 'qb-menu:client:subannounce',
            }
        },
        {
            header = "Mayor Misc",
            txt = "Open the misc menu",
            params = {
                event = 'qb-mayor:misc:main',
            }
        }
    }

    exports['qb-menu']:openMenu(MayorMenu)
end)

RegisterNetEvent('qb-menu:client:subannounce', function()
    local AnnouncementMenu = {
        {
            isMenuHeader = true,
            header = "Mayor Announcement"
        },
        {
            header = "Mayor Announcement Normal",
            txt = "Make a normal announcement without a emergency broadcast",
            params = {
                event = 'qb-mayor:client:announcementnormal',
            }
        },
        {
            header = "Mayor Announcement Emergency",
            txt = "Make a Emergency Broadcast",
            -- disabled = true,
            params = {
                event = 'qb-mayor:client:announcementemerg',
            }
        }
    }

    exports['qb-menu']:openMenu(AnnouncementMenu)
end)

--  Mayor Voting

RegisterNetEvent('qb-mayor:misc:main', function()
    local Mayormiscmain = {
        {
            isMenuHeader = true,
            header = "Mayor Announcement"
        },
        {
            header = "Open Voting Menu",
            txt = "This opens up the voting menu",
            params = {
                event = 'qb-mayor:vote:main',
            }
        },
        {
            header = "Panic Button",
            txt = "Alert police you're in distress",
            -- disabled = true,
            params = {
                event = 'qb-mayor:server:mdistress',
                isServer = true,
            }
        }
    }

    exports['qb-menu']:openMenu(Mayormiscmain)
end)

RegisterNetEvent('qb-mayor:vote:main', function()
    local MayorVotemain = {
        {
            isMenuHeader = true,
            header = "Mayor Elections"
        },
        {
            header = "Start the election",
            txt = "This starts a election",
            params = {
                event = 'qb-mayor:vote:start',
            }
        }
    }

    exports['qb-menu']:openMenu(MayorVotemain)
end)

-- Mayor Election

RegisterNetEvent('qb-mayor:vote:start')
AddEventHandler('qb-mayor:vote:start', function()
        print("Mayor voting started")   
        TriggerServerEvent('qb-mayor:vote:start:vote:notify')

        -- on screen keyboard

        local Canidate1 = tonumber(KeyboardInput('Canidate 1 ServerID:', 10))
                 if Canidate1 == nil then
                    TriggerEvent('QBCore:Notify',  "Not a valid ID", "error")
                     return
                 end

        local Canidate2 = tonumber(KeyboardInput('Canidate 2 ServerID:', 10))
                 if Canidate2 == nil then
                    TriggerEvent('QBCore:Notify',  "Not a valid ID", "error")
                     return
                 end

        local Canidate3 = tonumber(KeyboardInput('Canidate 3 ServerID:', 10))
                 if Canidate3 == nil then
                    TriggerEvent('QBCore:Notify', "Not a valid ID", "error")
                     return
                 end

        print(Canidate1 .. Canidate2 .. Canidate3)

        TriggerServerEvent('qb-mayor:vote:save:database', Canidate1)

end)

function KeyboardInput(TextEntry, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', '', '', '', '', MaxStringLenght)
	BlockInput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local Result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		BlockInput = false
		return Result
	else
		Citizen.Wait(500)
		BlockInput = false
		return nil
	end
end

-- Lets grab that announcement
--  Lets also send it back to the server to be displayed

RegisterNetEvent('qb-mayor:client:announcementnormal')
AddEventHandler('qb-mayor:client:announcementnormal', function()   

        Citizen.CreateThread(function()
            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 64)
            while (UpdateOnscreenKeyboard() == 0) do
                Citizen.Wait(0)
            end
            if (GetOnscreenKeyboardResult()) then
                local result = GetOnscreenKeyboardResult()
                TriggerServerEvent('qb-mayor:server:trigger:announcementnormal', result)
            end
        end)

end)

RegisterNetEvent('qb-mayor:client:announcementemerg')
AddEventHandler('qb-mayor:client:announcementemerg', function()   
        -- Show Keyboard Input 
        Citizen.CreateThread(function()
            DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 64)
            while (UpdateOnscreenKeyboard() == 0) do
                Citizen.Wait(0)
            end
            if (GetOnscreenKeyboardResult()) then
                local result = GetOnscreenKeyboardResult()
                TriggerServerEvent('qb-mayor:server:trigger:announcementemerg', result)
            end
        end)

end)

-- Lets go back to the server side.

RegisterNetEvent('qb-mayor:client:trigger:lockdown')
AddEventHandler('qb-mayor:client:trigger:lockdown', function()
    TriggerServerEvent('qb-mayor:server:trigger:lockdown')
end)