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
                -- TriggerServerEvent("alert:sv", result)
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

--  Mayor Voting

RegisterNetEvent('qb-mayor:vote:main', function()
    local MayorVotemain = {
        {
            isMenuHeader = true,
            header = "Mayor Voting"
        },
        {
            header = "Open Vote Menu",
            txt = "This opens up the voting menu",
            params = {
                event = 'qb-mayor:vote:system',
            }
        }
    }

    exports['qb-menu']:openMenu(MayorVotemain)
end)

RegisterNetEvent('qb-mayor:vote:system', function()
    local MayorVote = {
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

    exports['qb-menu']:openMenu(MayorVote)
end)