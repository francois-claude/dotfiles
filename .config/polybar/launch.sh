#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Detect monitors
SCREENS=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

## if one screen
if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
    MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar primary &
else
    PRIMARY_MONITOR=$(xrandr --query | grep primary | cut -d" " -f1)
    for m in $SCREENS; do
        if [[ $PRIMARY_MONITOR == $m ]]; then
            MONITOR=$m TRAY_POS=right polybar primary &
        else
            MONITOR=$m TRAY_POS=none polybar secondary &
        fi
    done
fi

echo "Polybar launched..."
