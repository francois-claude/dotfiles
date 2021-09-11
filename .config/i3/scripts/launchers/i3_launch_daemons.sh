#!/bin/sh

LOCKSCRIPT='/home/fclaude/.config/i3/scripts/lock/i3_pixel_lock.sh'

# launch xss-lock
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/xss-lock --ignore-sleep -- $LOCKSCRIPT"
/usr/bin/sleep 0.5

# launch nitrogen
/usr/bin/i3-msg "exec --no-startup-id /home/fclaude/.config/nitrogen/nitrogen.sh"
/usr/bin/sleep 0.5

# launch unclutter in background
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/unclutter --timeout 1 --fork"
/usr/bin/sleep 0.5

# launch picom
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/picom -b --config /home/fclaude/.config/picom/picom.conf"
/usr/bin/sleep 0.5

