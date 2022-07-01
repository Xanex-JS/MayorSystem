--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]

-- Don't Touch these VALUES!!!
Config = {}
Config.ALERT = {}

-- Discord Logs

Config.DiscordLogs = true -- If you want to use discord logs or Announcement
Config.Webhook = "https://discordapp.com/api/webhooks/992470687904174182/h43GF4K-qYdFaFTCzAyu89hci5rbGtf3CWcNUNgBNWBPSm8R36ymNiBQJxRRp6rl8MoC" -- Your webhook URL

-- Xanex's Mayor Resource Configuration
Config.UsePerms = 1 -- 1 = Use Perms. 2 = Don't use Perms (Everyone can then use the commands)
Config.PermissionSys = 'Discord' -- Discord = Use Discord Roles -- Ace == Ace Permissions -- CASE SENSITIVE

-- Mayor Lockdown Config

Config.Announce = 'mayora' -- Announcement Command
Config.Command = "mayorlockdown" -- Change this to whatever you wanna use :D

-- Don't Touch me unless you know what you're doing.
Config.ALERT.Volume = 0.2
