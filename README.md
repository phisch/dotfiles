# phisch's dotfiles
This repository contains the configuration files (dotfiles) of my setup. 

## `~` is a git repository
Yes, my home directory is a git repository! And the `.gitignore` file ignores everything.

To add a new file to the repository, it has to be force added with `git add --force file`. This way configuration **changes can be easily detected and committed**, and **nothing gets added accidentally**.

## Installation
To effortlessly get started on a fresh arch linux installation, an interactive installation script can be run:

```sh
bash <(curl -sL https://github.com/phisch/dotfiles/raw/master/.install)
```

### What does it do?
The installation script performs the following steps:

1) update arch linux
2) ask for and set selected locale and keymap (from a list of all available ones)
3) upload existing, or generate and upload new SSH key to GitHub (skipped if there already is a key that can authenticate with a GitHub account, can also be skipped manually)
4) install AUR helper (yay)
4) install Arch and AUR packages (listed below)
5) clone and install dotfiles (uses HTTPS if no SSH key can authenticate with a GitHub account)
6) set zsh as user shell

### Dependencies and applications
[bspwm-git](https://aur.archlinux.org/packages/bspwm-git/) *(AUR)*,
[chromium](https://www.archlinux.org/packages/extra/x86_64/chromium/),
[code](https://www.archlinux.org/packages/community/x86_64/code/),
[compton-git](https://aur.archlinux.org/packages/compton-git/) *(AUR)*,
[curl](https://www.archlinux.org/packages/core/x86_64/curl/),
[eog](https://www.archlinux.org/packages/extra/x86_64/eog/),
[feh](https://www.archlinux.org/packages/extra/x86_64/feh/),
[giph-git](https://aur.archlinux.org/packages/giph-git/) *(AUR)*,
[git](https://www.archlinux.org/packages/extra/x86_64/git/),
[gnome-calculator](https://www.archlinux.org/packages/extra/x86_64/gnome-calculator/),
[gnome-disk-utility](https://www.archlinux.org/packages/extra/x86_64/gnome-disk-utility/),
[gnome-mpv](https://www.archlinux.org/packages/community/x86_64/gnome-mpv/),
[go](https://www.archlinux.org/packages/community/x86_64/go/),
[gucharmap](https://www.archlinux.org/packages/extra/x86_64/gucharmap/),
[jetbrains-toolbox](https://aur.archlinux.org/packages/jetbrains-toolbox/) *(AUR)*,
[jre-openjdk](https://www.archlinux.org/packages/extra/x86_64/jre-openjdk/),
[maim](https://www.archlinux.org/packages/community/x86_64/maim/),
[nautilus](https://www.archlinux.org/packages/extra/x86_64/nautilus/),
[noto-fonts-emoji](https://www.archlinux.org/packages/extra/any/noto-fonts-emoji/),
[openssh](https://www.archlinux.org/packages/core/x86_64/openssh/),
[pavucontrol](https://www.archlinux.org/packages/extra/x86_64/pavucontrol/),
[pepper-flash](https://www.archlinux.org/packages/extra/x86_64/pepper-flash/),
[phocus-gtk-theme-git](https://aur.archlinux.org/packages/phocus-gtk-theme-git/) *(AUR)*,
[polybar-git](https://aur.archlinux.org/packages/polybar-git/) *(AUR)*,
[rofi-git](https://aur.archlinux.org/packages/rofi-git/) *(AUR)*,
[rxvt-unicode](https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/),
[slop](https://www.archlinux.org/packages/community/x86_64/slop/),
[sxhkd-git](https://aur.archlinux.org/packages/sxhkd-git/) *(AUR)*,
[ttf-dejavu](https://www.archlinux.org/packages/extra/any/ttf-dejavu/),
[ttf-material-design-icons-git](https://aur.archlinux.org/packages/ttf-material-design-icons-git/) *(AUR)*,
[vlc](https://www.archlinux.org/packages/extra/x86_64/vlc/),
[wmname](https://www.archlinux.org/packages/community/x86_64/wmname/),
[xorg-server](https://www.archlinux.org/packages/extra/x86_64/xorg-server/),
[xorg-xinit](https://www.archlinux.org/packages/extra/x86_64/xorg-xinit/),
[xorg-xrandr](https://www.archlinux.org/packages/extra/x86_64/xorg-xrandr/),
[xorg-xsetroot](https://www.archlinux.org/packages/extra/x86_64/xorg-xsetroot/),
[yay](https://aur.archlinux.org/packages/yay/) *(AUR)*
[zsh](https://www.archlinux.org/packages/extra/x86_64/zsh/)