# Firejail profile for discord
# This file is overwritten after every install/update
# Persistent local customizations
include discord.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.config/discord

mkdir ${HOME}/.config/discord
whitelist ${HOME}/.config/discord

## add file
whitelist ${HOME}/.config/local/share/recently-used.xbel

private-bin discord
private-opt discord

# Redirect
include discord-common.profile
