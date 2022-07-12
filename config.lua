--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

-- Don't Touch these VALUES!!!
Config = {}
Config.ALERT = {}

-- Resource Wide Configuration

Config.DiscordLogs = true -- If you want to use discord logs or Announcement
Config.Webhook = "" -- Your webhook URL

Config.UsePerms = 1 -- 1 = Use Perms. 2 = Don't use Perms (Everyone can then use the commands)
Config.PermissionSys = 'Discord' -- Discord = Use Discord Roles -- Ace == Ace Permissions -- CASE SENSITIVE

-- Lockdown Specifict Config

Config.Announce = 'mayora' -- Announcement Command
Config.Command = "mayorlockdown" -- Change this to whatever you wanna use :D

-- Mayor Vote Specific Config

Config.MayorVote = true -- If you want to use the Mayor Vote System, change to false to not use it.

Config.prefix = '[AussieDropBear Mayor]'
