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
Config.UsePerms = 1 -- 1 = Use Perms. 2 = Don't use Perms (Everyone can then use the commands)
Config.PermissionSys = 'Discord' -- Discord = Use Discord Roles -- Ace == Ace Permissions -- CASE SENSITIVE
-- Lockdown Specifict Config

Config.Announce = 'mayora' -- Announcement Command
Config.Command = "mayorlockdown" -- Change this to whatever you wanna use for the lockdown command.
-- Mayor Vote Specific Config

Config.VoteStartCommand = 'startMayorVote' -- This is the command for starting a mayor vote.
Config.StartVotePermission = 'mayor' -- Permission needed to execute a new mayor vote.
Config.GiveMayor = 'giveMayor' -- THis is the command to assign someone mayor, this system will become automatic with the voting in the future.

Config.VoteCommand = 'vote' -- This is the command for voting.

Config.MayorVote = true -- If you want to use the Mayor Vote System, change to false to not use it.

Config.prefix = '^1[AussieDropBear_Mayor] ' -- Self Explanatory
-- Discord Permissions.

-- Role list for the mayor role in discord, if you're using ACE Permissions ignore the below code.

roleList = {
    "ARP | Mayor", -- Mayor Role :D
}

-- Ace Permissions

Config.AcePermissionsGroup = 'mayor' -- This is the mayor group name if using ACE Permissions if you're using discord permission just ignore this