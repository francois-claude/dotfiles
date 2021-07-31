#!/bin/sh

# launch nextcloud in tray
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/nextcloud --background"
/usr/bin/sleep 0.5

# launch solaar in tray
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/solaar --window hide"
/usr/bin/sleep 0.5

# launch pasystray in tray
/usr/bin/i3-msg "exec --no-startup-id /usr/bin/pasystray"
/usr/bin/sleep 0.5
