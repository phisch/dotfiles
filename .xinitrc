#!/usr/bin/env bash

#xrandr --output DP-0 --mode 2560x1440 --rate 144.00 --rotate normal --pos 0x0 --primary

feh --randomize --bg-fill --recursive --no-fehbg ~/Pictures/wallpapers/*

[ "$HOSTNAME" == "laptop" ] && echo "Xft.dpi: 126" | xrdb -merge
echo "Xcursor.size: 32" | xrdb -merge
xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 32

exec bspwm
