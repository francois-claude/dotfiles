#!/bin/sh

LOCKSCRIPT='/home/fclaude/.config/i3/scripts/lock/i3_pixel_lock.sh'

revert_dpms() {

    # force monitors to activate
    /usr/bin/xset dpms force on     

    # sets dpms to default values (seconds)
    # (standby | suspend | off)

    /usr/bin/xset +dpms dpms 3600 3600 3600
}

# set trap for revert_dpms function
trap revert_dpms HUP INT TERM

# kill monitors
/usr/bin/sleep 1.5
/usr/bin/xset dpms force off

# revert dpms values
revert_dpms
