--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

-- Don't Touch these VALUES!!!
Config = {}
-- Resource Wide Configuration
Config.DiscordLogs = true -- If you want to use discord logs or Announcement
Config.Webhook = "" -- Your webhook URL

-- The role to give the new mayor (discord role name)
roleList = {
    "Mayor", -- Mayor Role :D
}

Config.EAS = {}

Config.EAS.Volume = 0.2 --(0.2 = 20% Volume)


-- Don't touch me 
Config.Peds = {
    {
        type = 'votingped',
        position = vector4(418.07, -986.28, 28.40, 88.59)
    },
}