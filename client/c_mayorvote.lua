--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

------------------ Mayor System Voting Stuff ----------------

-- Start of Create a Ped 

-- vector3(418.07, -986.28, 29.39)

local used = false
local HasVote = false

RegisterNetEvent('qb-mayor:vote:spawn:ped')
AddEventHandler('qb-mayor:vote:spawn:ped', function()

    RequestModel( GetHashKey( "a_m_m_bevhills_02" ) )
    while ( not HasModelLoaded( GetHashKey( "a_m_m_bevhills_02" ) ) ) do
    Citizen.Wait( 1 )
    end

    local ped = CreatePed(4, 0x3FB5C3D3, -546.36, -209.33, 36.65, 207.63, true, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES", 0, true)

end)
-- Auto make ped

function SetUpVotePed()
    RequestModel( GetHashKey( "a_m_m_bevhills_02" ) )
    while ( not HasModelLoaded( GetHashKey( "a_m_m_bevhills_02" ) ) ) do
    Citizen.Wait( 1 )
    end

    local ped = CreatePed(2, 0x3FB5C3D3, -546.36, -209.33, 36.65, 207.63, false, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetPedKeepTask(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_COP_IDLES", 0, true)
end

function CreatePeds()
    for i = 1, #Config.Peds do
        if Config.Peds[i].type == 'votingped' then
            SetUpVotePed(Config.Peds[i].position, i)
        end
    end
end

CreateThread(function()
    CreatePeds()
end)



        exports['qb-target']:AddTargetModel({0x3FB5C3D3}, {
            options = {
                {
                    event = "qb-mayor:vote:menu",
                    icon = "fas fa-box-circle-check",
                    label = "Vote for Mayor",
                },
                {
                    event = "qb-mayor:server:check:votes",
                    icon = "fas fa-box-circle",
                    label = "Check Votes",
                },            
            },
            distance = 2
        })

RegisterNetEvent('qb-mayor:server:check:votes')
AddEventHandler('qb-mayor:server:check:votes', function()
        ExecuteCommand('checkvote')
end)
-- Vote input menu 
 local HasVoted = false
RegisterNetEvent('qb-mayor:vote:menu')
AddEventHandler('qb-mayor:vote:menu', function(result)
        print("[QBCore] Mayor Vote Menu")

         if not HasVoted then 

        local result = QBCore.Functions.TriggerCallback('CheckCandidates', function(result)
                
            local VoteMenuInput = {
                {
                    header = "Cast Vote",
                    isMenuHeader = true
                }
            }
        
            for k, v in pairs(result) do
                VoteMenuInput[#VoteMenuInput+1] = {
                    header = v.CharacterName,
                    txt = 'Votes: '..v.Votecount,
                    params = {
                        event = 'qb-menu:vote:menu:client:input',
                        args = { voted = v.CharacterName}
                    }
                }
            end

            exports['qb-menu']:openMenu(VoteMenuInput)
        end)
        end

         if HasVoted then 
             TriggerEvent('QBCore:Notify',  "You've already voted?", "error")
         end

        
        HasVoted = true
end)

-- Lets create a ped

 RegisterNetEvent('qb-menu:vote:menu:client:input', function(data)
     TriggerServerEvent('qb-menu:vote:menu:server:input', data)
end)


-- RegisterCommand('createped', function()
        -- TriggerEvent('qb-mayor:vote:spawn:ped')
-- end)

------------------ Mayor System Voting Stuff ----------------