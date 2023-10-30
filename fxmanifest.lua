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
	'server/misc.lua', -- Mayor Consume ETC 
	'server/s_nui.lua', -- Mayor Announce GUI
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
	'client/c_nui.lua', -- Mayor Announce GUI
	'client/c_mayorvote.lua', -- Vote for a mayor
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
	'GUI_Files/index.html'
  }
  
  files {
	'GUI_Files/index.html',
  
	'GUI_Files/main.css',
  
	'GUI_Files/main.js',
  
	'fonts/VCR_OSD_MONO.ttf',
  
	'GUI_Files/alert.mp3'
  }
  
server_export 'SendAlertToDisplay'
server_export 'SendAlertToDisplayEmerg'
server_export 'MayorLockdDownExport'
server_export 'MayorSystemAnnouncement'