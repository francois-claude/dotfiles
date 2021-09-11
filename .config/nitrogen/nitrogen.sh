#!/usr/bin/env bash

# Terminate already running bar instances
killall -q nitrogen

# Wait until the processes have been shut down
while pgrep -u $UID -x nitrogen >/dev/null; do sleep 1; done

# launch nitrogen (ultrawide)
/usr/bin/nitrogen \
  --head=0 \
  --set-centered \
  --random '/home/fclaude/Pictures/wallpaper/ultrawide/gradients' 

/usr/bin/sleep 0.5

/usr/bin/nitrogen \
  --head=1 \
  --set-centered \
  --random '/home/fclaude/Pictures/wallpaper/vertical/gradients'
/usr/bin/sleep 0.5

