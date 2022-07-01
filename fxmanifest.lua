--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]
fx_version 'adamant'

game 'gta5'

description 'Scottish Mayoral System'

version '1.0.0'

server_scripts {
	'config.lua', -- Config File
	'server/s_mayorannounce.lua', -- Mayor Announce
	'server/server.lua' -- Mayor Resource Permission Checker
}

client_scripts {
	'config.lua', -- Config File
	'client/lockdown.lua', -- Lockdown permission check
	'functions.lua', -- Leave me alone
	'client/c_mayorannounce.lua', -- Mayor Announce
	'client/mlockdown_c.lua' -- Mayor Lockdown
}

escrow_ignore {
	'config.lua',
	'readme.md'
}
