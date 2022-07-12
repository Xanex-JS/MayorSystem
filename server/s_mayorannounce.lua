--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

--  Registering the event from client to server to send logs to the discord server.

RegisterServerEvent("LoggingLockdown")
AddEventHandler("LoggingLockdown", function()
        if Config.DiscordLogs == true then
          sendToDiscord(16753920, "Mayor Lockdown" .. "" .. "\n- Lockdown has been initiated by " .. GetPlayerName(source))
end
end)

-- Announcement Server Register

RegisterServerEvent("mayorannounce")
AddEventHandler("mayorannounce", function(param, reason)
    local name = GetPlayerName(source)
    local messageContent = "\n- Author: "..GetPlayerName(source).."\n- Announcement: " .. param .. ""

    if Config.DiscordLogs == true then
    TriggerClientEvent("chatMessage", -1, "^1[Mayor Announcement]^2", {0,0,0}, param)
      sendToDiscord(16753920, "Mayor Announcement" .. "" .. messageContent)
  else
      TriggerClientEvent("chatMessage", -1, "^1[Mayor Announcement]^2", {0,0,0}, param)
  end
end)


-- Sending Logs to discord

function sendToDiscord(color, name, message, footer)
     -- local name = GetPlayerName(source)
     -- local reason = ""
  local embed = {
        {
            ["color"] = color,
            ["title"] = name,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "MayorSystem on "..formatDateString(os.time()),
            },
        }
    }

  PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({content = text, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function formatDateString(string)
	local dateFormat = GetConvar("ea_dateFormat", '%d/%m/%Y 	%H:%M:%S')
	return os.date(dateFormat, string)
end
