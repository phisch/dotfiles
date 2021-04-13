#!/usr/bin/env bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

~/.monitors

feh --randomize --bg-fill --recursive --no-fehbg ~/Pictures/wallpapers/*

[ "$HOSTNAME" == "laptop" ] && echo "Xft.dpi: 126" | xrdb -merge
echo "Xcursor.size: 32" | xrdb -merge
xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 32

exec bspwm
