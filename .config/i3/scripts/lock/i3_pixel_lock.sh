#!/bin/sh

## create tmpf
tmpf=$(/usr/bin/mktemp -t flshot-XXXX)

## run flameshot and export to tmpf
/usr/bin/flameshot full --raw > "$tmpf"

## pixelate with convert and pipe through i3lock
/usr/bin/convert "$tmpf" \
    -scale 10% \
    -scale 1000% \
    RGB:- \
        | /usr/bin/i3lock \
              --raw 5280x2560:rgb \
              --ignore-empty-password \
              --image /dev/stdin \
              --nofork

# rm tmpf
if [ -f "$tmpf" ]; then
    /usr/bin/shred \ 
        --force 
        --iterations 3 \
        --remove "$tmpf"
fi
