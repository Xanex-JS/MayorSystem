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
        print("test")
    TriggerClientEvent('qb-mayor:open:menu', source)
    else
        TriggerClientEvent('QBCore:Notify', source,  "Only the mayor job can use this", "error")
    end
end)
---------------- / Mayor System ----------------
