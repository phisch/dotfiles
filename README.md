# phisch's dotfiles
This repository contains the configuration files (dotfiles) of my setup. 

## `~` is a git repository
Yes, my home directory is a git repository! And the `.gitignore` file ignores everything.

To add a new file to the repository, it has to be force added with `git add --force file`. This way configuration **changes can be easily detected and committed**, and **nothing gets added accidentally**.

## Installation
A convenient installation script based on [archinstall](https://archlinux.org/packages/extra/any/archinstall/) can be used to install and setup Arch Linux, my dotfiles and dependencies. And this is how it works:

### Prepare Arch Linux live USB medium
Download the [official Arch Linux iso](https://archlinux.org/download/) and create a bootable USB drive:

```sh
dd if=path/to/archlinux.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

### Run the installer
Boot into the live USB, connect to wifi, install [archinstall](https://archlinux.org/packages/extra/any/archinstall/) and run the installation script:

```sh
iwctl # [iwd] station DEVICE connect ESSID
python3 <(curl -sL https://github.com/phisch/dotfiles/raw/master/.install)
```

### What does the installer do?
The code is easy to read, so have a look at the [.install](.install) python script to see in detail. To roughly sum it up:

1) partition and install archlinux to selected hard drive
2) set locale, keymaps, timezones
3) install and configure the dependencies that are listed below
4) create a user and install this repositories dotfiles for him
5) enable services, configure autologin and some more

### Dependencies and applications
[acpilight](https://archlinux.org/packages/community/any/acpilight/),
[alacritty](https://archlinux.org/packages/community/x86_64/alacritty/),
[baobab](https://archlinux.org/packages/extra/x86_64/baobab/),
[bluez](https://archlinux.org/packages/extra/x86_64/bluez/),
[bluez-utils](https://archlinux.org/packages/extra/x86_64/bluez-utils/),
[bspwm](https://archlinux.org/packages/community/x86_64/bspwm/),
[code](https://www.archlinux.org/packages/community/x86_64/code/),
[curl](https://www.archlinux.org/packages/core/x86_64/curl/),
[discord](https://archlinux.org/packages/community/x86_64/discord/),
[dkms](https://archlinux.org/packages/extra/any/dkms/),
[docker-compose](https://www.archlinux.org/packages/community/any/docker-compose/),
[docker](https://www.archlinux.org/packages/community/x86_64/docker/),
[eog](https://www.archlinux.org/packages/extra/x86_64/eog/),
[evince](https://archlinux.org/packages/extra/x86_64/evince/),
[feh](https://www.archlinux.org/packages/extra/x86_64/feh/),
[figma-linux](https://aur.archlinux.org/packages/figma-linux/) *(AUR)*,
[foliate](https://archlinux.org/packages/community/x86_64/foliate/),
[font-manager](https://aur.archlinux.org/packages/font-manager/) *(AUR)*,
[giph](https://aur.archlinux.org/packages/giph/) *(AUR)*,
[git](https://www.archlinux.org/packages/extra/x86_64/git/),
[gnome-calculator](https://www.archlinux.org/packages/extra/x86_64/gnome-calculator/),
[gnome-disk-utility](https://www.archlinux.org/packages/extra/x86_64/gnome-disk-utility/),
[google-chrome-dev](https://aur.archlinux.org/packages/google-chrome-dev/) *(AUR)*,
[intel-ucode](https://archlinux.org/packages/extra/any/intel-ucode/),
[iwd](https://archlinux.org/packages/community/x86_64/iwd/),
[jetbrains-toolbox](https://aur.archlinux.org/packages/jetbrains-toolbox/) *(AUR)*,
[linux-headers](https://archlinux.org/packages/core/x86_64/linux-headers/),
[maim](https://www.archlinux.org/packages/community/x86_64/maim/),
[man-db](https://archlinux.org/packages/core/x86_64/man-db/),
[nano](https://www.archlinux.org/packages/core/x86_64/nano/),
[nautilus](https://www.archlinux.org/packages/extra/x86_64/nautilus/),
[openssh](https://www.archlinux.org/packages/core/x86_64/openssh/),
[paru-bin](https://aur.archlinux.org/packages/paru-bin/) *(AUR)*,
[pavucontrol](https://www.archlinux.org/packages/extra/x86_64/pavucontrol/),
[phocus-gtk-theme-git](https://aur.archlinux.org/packages/phocus-gtk-theme-git/) *(AUR)*,
[picom-git](https://aur.archlinux.org/packages/picom-git/) *(AUR)*,
[polkit](https://archlinux.org/packages/extra/x86_64/polkit/),
[polkit-gnome](https://archlinux.org/packages/community/x86_64/polkit-gnome/),
[polybar](https://aur.archlinux.org/packages/polybar/) *(AUR)*,
[pulseaudio](https://www.archlinux.org/packages/extra/x86_64/pulseaudio/),
[pulseaudio-bluetooth](https://archlinux.org/packages/extra/x86_64/pulseaudio-bluetooth/),
[reflector](https://archlinux.org/packages/community/any/reflector/),
[rofi](https://archlinux.org/packages/community/x86_64/rofi/),
[rtl88xxau-aircrack-dkms-git](https://aur.archlinux.org/packages/rtl88xxau-aircrack-dkms-git/) *(AUR)*,
[sxhkd](https://archlinux.org/packages/community/x86_64/sxhkd/),
[ttf-dejavu](https://www.archlinux.org/packages/extra/any/ttf-dejavu/),
[ttf-jetbrains-mono](https://archlinux.org/packages/community/any/ttf-jetbrains-mono/),
[ttf-material-design-icons-git](https://aur.archlinux.org/packages/ttf-material-design-icons-git/) *(AUR)*,
[vlc](https://www.archlinux.org/packages/extra/x86_64/vlc/),
[wmname](https://www.archlinux.org/packages/community/x86_64/wmname/),
[xclip](https://archlinux.org/packages/extra/x86_64/xclip/),
[xdg-user-dirs](https://www.archlinux.org/packages/extra/x86_64/xdg-user-dirs/),
[xorg-server](https://www.archlinux.org/packages/extra/x86_64/xorg-server/),
[xorg-xinit](https://www.archlinux.org/packages/extra/x86_64/xorg-xinit/),
[xorg-xrandr](https://www.archlinux.org/packages/extra/x86_64/xorg-xrandr/),
[xorg-xsetroot](https://www.archlinux.org/packages/extra/x86_64/xorg-xsetroot/),
[zsh](https://www.archlinux.org/packages/extra/x86_64/zsh/)
