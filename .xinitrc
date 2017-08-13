#!/usr/bin/env zsh
~/.monitors
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
feh --randomize --bg-fill ~/Pictures/wallpapers/*
export PATH=$HOME/bin:$PATH
exec bspwm
