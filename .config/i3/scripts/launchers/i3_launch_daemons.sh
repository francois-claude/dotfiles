#!/bin/sh

LOCKSCRIPT='/home/fclaude/.config/i3/scripts/lock/i3_pixel_lock.sh'

# launch xss-lock
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/xss-lock --ignore-sleep -- $LOCKSCRIPT"

# launch picom in background
#/usr/bin/i3-msg "exec --no-startup-id /usr/bin/picom -b --config /home/fclaude/.config/picom/picom.conf"

# launch nitrogen in background
#/usr/bin/i3-msg "exec --no-startup-id /usr/bin/nitrogen --restore"

# launch unclutter in background
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/unclutter --timeout 1 --fork"
