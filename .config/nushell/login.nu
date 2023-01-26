#!/usr/bin/env nu

if ("DISPLAY" not-in env.name and $env.XDG_VTNR == "1") {
    if (sys).host.hostname == "tower" {
        startx
    } else if (sys).host.hostname == "laptop" {
        sway
    }
}
