# Shortcuts
[sxhkd](https://github.com/baskerville/sxhkd) is the X hotkey daemon used to control bspwm, other applications, hardware and media. The shortcuts are defined in the file [.config/sxhkd/sxhkdrc](sxhkdrc). Following, all defined shortcuts and their functions.

## General

Shortcut|Action
---|---
`Super + Escape`|reload sxhkd shortcut definitions
`Super + Alt + Escape`|exit bspwm

## Applications

Shortcut|Action
---|---
`Super + Return`|open terminal
`(Super, Alt) + Space` or `XF86LaunchA`|open rofi as application launcher
`Alt + Tab`|open rofi as window switcher

## Bspwm

Shortcut|Action
---|---
`Super + (Shift +) W`|close (kill) active node
`Super + (Left, Right)`|switch to previous/next desktop on the active monitor
`Super + 1..8`|select desktop 1..8
`Ctrl + Alt + (Up, Right, Down, Left)`|preselect from current node
`Ctrl + Alt + Space` or `Escape`|cancel preselect of current node
`Ctrl + Alt + 1..9`|set preselect ratio from 10-90%
`Ctrl + Super + (Up, Right, Down, Left)`|select node in given direction
`Shift + Super (Up, Right, Down, Left)`|move node in given direction
`Super + Alt + (Left, Right)`|move node to previous/next desktop
`Super + Alt + 1..8`|move current node to desktop 1..8
`Super + T`|set `tiled` node state
`Super + Shift + T`|toggle `pseudo_tiled` node state
`Super + F`|toggle `floating` node state
`Super + Shift + F`|toggle `fullscreen` node state
`Super + M`|toggle 'monocle' desktop view

## Hardware

Shortcut|Action
---|---
`XF86AudioMute`|mute/unmute speaker
`XF86AudioLowerVolume, XF86AudioRaiseVolume`|increase/decrease speaker volume
`XF86AudioMicMute`|mute/unmute microphone
`Alt + B + (Page Up, Page Down)` or `XF86MonBrightnessUp, XF86MonBrightnessDown`|increase/decrease monitor backlight

## Screenshot & gif recording
Shortcut|Action
---|---
`Print`|take a screenshot of a selection
`Ctrl + Print`|start/stop a gif recording of a selection