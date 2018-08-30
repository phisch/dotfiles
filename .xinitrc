#!/usr/bin/env zsh

feh --randomize --bg-fill --recursive --no-fehbg ~/Pictures/wallpapers
xsetroot -cursor_name left_ptr
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec bspwm
