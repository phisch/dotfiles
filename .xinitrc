#!/usr/bin/env bash

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

xset s off

exec bspwm
