#!/usr/bin/env zsh
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr
feh --randomize --bg-fill ~/Pictures/wallpapers/*
export PATH=$HOME/bin:$PATH
exec bspwm
