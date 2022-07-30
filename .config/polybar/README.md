## Bluetooth headphones
The `volume-headphones` and `battery-headphones` modules need to be shown and hidden when the headphones are connected or disconnected.

This can be done by creating a udev rule in `/etc/udev/rules.d/`:
```sh
SUBSYSTEM=="input", ACTION=="add", ATTR{PHYS}="8:ba:f8:10:8d:e8", ENV{XDG_RUNTIME_DIR}="/run/user/1000", RUN+="/usr/bin/polybar-msg action '#headphone-volume.module_show'" RUN+="/usr/bin/polybar-msg action '#headphone-battery.module_show'"
SUBSYSTEM=="input", ACTION=="remove", ATTR{PHYS}="8:ba:f8:10:8d:e8", ENV{XDG_RUNTIME_DIR}="/run/user/1000", RUN+="/usr/bin/polybar-msg action '#headphone-volume.module_hide'" RUN+="/usr/bin/polybar-msg action '#headphone-battery.module_hide'"
```
And then reloading the udev rules with `sudo udevadm control --reload`.

