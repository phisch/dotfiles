# phisch's dotfiles
This repository contains the configuration files (dotfiles) of my setup. 

## `~` is a git repository
Yes, my home directory is a git repository! And the `.gitignore` file ignores everything.

To add a new file to the repository, it has to be force added with `git add --force file`. This way configuration **changes can be easily detected and committed**, and **nothing gets added accidentally**.

## Installation
I'm using an installation script based on [archinstall](https://archlinux.org/packages/extra/any/archinstall/) helps me to install and setup Arch Linux, my dotfiles and dependencies. And this is how it works:

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