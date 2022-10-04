# phisch's dotfiles

This repository contains the configuration files (dotfiles) of my setup.

## `~` is a git repository

Yes, my home directory is a git repository! And the `.gitignore` file ignores everything.

To add a new file to the repository, it has to be force added with `git add --force file`. This way configuration **changes can be easily detected and committed**, and **nothing gets added accidentally**.

## Installation

Download the [official Arch Linux iso](https://archlinux.org/download/) and create a bootable USB drive:

```sh
dd if=path/to/archlinux.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

Boot into the live USB, connect to wifi and use [archinstall](https://archlinux.org/packages/extra/any/archinstall/) to perform a basic Archlinux installation:

```sh
iwctl # [iwd] station DEVICE connect ESSID
archinstall # follow instructions
```

### Setup script

These dotfiles contain a handy setup script that installs and configures every dependency and component I need.

Using it is as simple as installing these dotfiles, and running the install script:

```sh
cd $(mktemp -d) && git clone https://github.com/phisch/dotfiles.git . && cp -rb . ~
~/.setup/install
```
