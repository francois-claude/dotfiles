#!/bin/sh

LOCKSCRIPT='/home/fclaude/.config/i3/scripts/lock/i3_pixel_lock.sh'

# launch xss-lock
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/xss-lock --ignore-sleep -- $LOCKSCRIPT"
/usr/bin/sleep 0.5

# launch nitrogen (ultrawide)
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/nitrogen --head=0 --set-centered --random /home/fclaude/Pictures/wallpaper/ultrawide/gradients"
/usr/bin/sleep 0.5

# launch nitrogen (widescreen)
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/nitrogen --head=1 --set-centered --random /home/fclaude/Pictures/wallpaper/vertical/gradients"
/usr/bin/sleep 0.5

# launch unclutter in background
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/unclutter --timeout 1 --fork"
/usr/bin/sleep 0.5

# launch picom
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/picom -b --config /home/fclaude/.config/picom/picom.conf"
/usr/bin/sleep 0.5

