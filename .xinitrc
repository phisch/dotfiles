#!/usr/bin/env bash

#xrandr --output DP-0 --mode 2560x1440 --rate 144.00 --rotate normal --pos 0x0 --primary

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh --randomize --bg-fill --recursive --no-fehbg ~/Pictures/wallpapers/*

xsetroot -xcf /usr/share/icons/Adwaita/cursors/left_ptr 16

exec bspwm
