# AussieDropBear's Mayor Lockdown and Announce

Drag and Drop ``MayorSystem`` to your resources folder, then add ``ensure MayorSystem`` to your server.cfg or resources.cfg

# Permissions

Make sure to add these permissions to your server.cfg or permissions.cfg.

add_ace group.mayor mayor allow


If you don't have a ``group.mayor`` ace permission simply change it to the ace permission your mayor has.

# Dependencies

This does require Badger_Discord_API for the permissions for Discord. if you somehow don't want to use Badger_Discord_API then change the value in the config. from Discord to Ace.

# Configuration

If for some reason you want everyone to use this resource then change Config.UsePerms to false

Config.PermissionSys = 'Ace' -- This will use Ace permissions as the permission restriction
Config.PermissionSys = 'Discord' -- This will use Discord Roles which requires Badger_Discord_API.

# Important

Please note if you wish to use DiscordPermissions you MUST keep the resource name as MayorSystem otherwise the discord api will NOT work.

Due to me enabling escrow there's no way around this.
