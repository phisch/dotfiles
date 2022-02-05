#!/usr/bin/env bash

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

~/.monitors

feh --randomize --bg-fill --recursive --no-fehbg ~/Pictures/wallpapers/*

if [ "$HOSTNAME" == "laptop" ]; then
    echo "Xft.dpi: 144" | xrdb -merge
    echo "Xcursor.size: 48" | xrdb -merge
fi

xsetroot -cursor_name left_ptr
xset s off

exec bspwm
