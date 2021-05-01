#!/bin/sh

# launch nextcloud in tray
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/nextcloud --background"
sleep 0.5

# launch solaar in tray
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/solaar --window hide"
sleep 0.5

# launch pasystray in tray
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/pasystray"
sleep 0.5
