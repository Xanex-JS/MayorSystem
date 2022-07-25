--[[

    Author: AussieDropBear#1347
    Description: This kinda cool script was made by AussieDropBear Owner of Aspire Gaming Networks
    Insperation: This script was inspired by the lockdown system on Garry's Mod DarkRP

]]
fx_version 'adamant'

game 'gta5'

description 'AussieDropBears Mayor System'

version '1.0.0'

server_scripts {
	'server/mayor_events_item.lua', -- Mayor Consume ETC 
	'qbcore_mayor/s_nui.lua', -- Mayor Announce GUI
	'config.lua', -- Config File
	'server/s_mayorannounce.lua', -- Mayor Announce
	'server/mlockdown_s.lua', -- Mayor Lockdown
	'server/s_mayorvote.lua', -- Mayor System
	'server/server.lua', -- Mayor Resource Permission Checker
	'@mysql-async/lib/MySQL.lua', -- MySQL Library
}

client_scripts {
	'client/mayor_menu.lua', -- Mayor menu
	'config.lua', -- Config File
	'qbcore_mayor/c_nui.lua', -- Mayor Announce GUI
	'client/c_mayorvote.lua', -- Vote for a mayor
	'client/lockdown.lua', -- Lockdown permission check
	'functions.lua', -- Leave me alone
	'client/c_mayorannounce.lua', -- Mayor Announce
	'client/mlockdown_c.lua' -- Mayor Lockdown
}

shared_script 'config.lua'

lua54 'yes'

escrow_ignore {
	'config.lua',
	'readme.md'
}

ui_page {
	'qbcore_mayor/index.html'
  }
  
  files {
	'qbcore_mayor/index.html',
  
	'qbcore_mayor/main.css',
  
	'qbcore_mayor/main.js',
  
	'fonts/VCR_OSD_MONO.ttf',
  
	'qbcore_mayor/alert.mp3'
  }
  
server_export 'SendAlertToDisplay'
server_export 'SendAlertToDisplayEmerg'
server_export 'MayorLockdDownExport'
server_export 'MayorSystemAnnouncement'