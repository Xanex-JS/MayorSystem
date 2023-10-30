--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

-- Mayor Distress

RegisterNetEvent('qb-mayor:server:mdistress')
AddEventHandler('qb-mayor:server:mdistress', function()
    print("The mayor requested urgent police assistance")
    
    TriggerEvent('AlertPoliceMayor')

end)