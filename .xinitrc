#!/usr/bin/env zsh
~/.monitors
pulseaudio -D
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
feh --randomize --bg-fill ~/Pictures/wallpapers/*.png ~/Pictures/wallpapers/*.jpg
export PATH=$HOME/bin:$PATH
export SUDO_ASKPASS="/usr/local/bin/askpass"
exec bspwm
