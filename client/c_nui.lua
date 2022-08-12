RegisterNetEvent("SendAlert")
AddEventHandler("SendAlert", function(result)
    SendNUIMessage({
        type    = "alert",
        enable  = true,
        issuer  = "Mayor System",
        message = result,
        volume  = Config.EAS.Volume
    })
end)

RegisterNetEvent("alert:Send")
AddEventHandler("alert:Send", function(result)
            TriggerEvent('SendAlert', result)
end)

-- Emergency Broadcast

RegisterNetEvent("SendAlertEmerg")
AddEventHandler("SendAlertEmerg", function(result)
    SendNUIMessage({
        type    = "emergency",
        enable  = true,
        issuer  = "Mayor System",
        message = result,
        volume  = Config.EAS.Volume
    })
end)

RegisterNetEvent("alert:SendEmerg")
AddEventHandler("alert:SendEmerg", function(result)
            TriggerEvent('SendAlertEmerg', result)
end)