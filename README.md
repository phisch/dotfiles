# phisch's dotfiles
This repository contains the configuration files (dotfiles) of my setup. 



## dependencies and tools

- [bspwm-git](https://aur.archlinux.org/packages/bspwm-git/) *(AUR)*
- [compton-git](https://aur.archlinux.org/packages/compton-git/) *(AUR)*
- [eog](https://www.archlinux.org/packages/extra/x86_64/eog/)
- [giph-git](https://aur.archlinux.org/packages/giph-git/) *(AUR)*
- [git](https://www.archlinux.org/packages/extra/x86_64/git/)
- [gnome-calculator](https://www.archlinux.org/packages/extra/x86_64/gnome-calculator/)
- [gnome-disk-utility](https://www.archlinux.org/packages/extra/x86_64/gnome-disk-utility/)
- [gnome-mpv](https://www.archlinux.org/packages/community/x86_64/gnome-mpv/)
- [google-chrome-dev](https://aur.archlinux.org/packages/google-chrome-dev/) *(AUR)*
- [gucharmap](https://www.archlinux.org/packages/extra/x86_64/gucharmap/)
- [jetbrains-toolbox](https://aur.archlinux.org/packages/jetbrains-toolbox/) *(AUR)*
- [maim](https://www.archlinux.org/packages/community/x86_64/maim/)
- [nautilus](https://www.archlinux.org/packages/extra/x86_64/nautilus/)
- [noto-fonts-emoji](https://www.archlinux.org/packages/extra/any/noto-fonts-emoji/)
- [pavucontrol](https://www.archlinux.org/packages/extra/x86_64/pavucontrol/)
- [polybar-git](https://aur.archlinux.org/packages/polybar-git/) *(AUR)*
- [rofi-git](https://aur.archlinux.org/packages/rofi-git/) *(AUR)*
- [rxvt-unicode](https://www.archlinux.org/packages/community/x86_64/rxvt-unicode/)
- [slop](https://www.archlinux.org/packages/community/x86_64/slop/)
- [sxhkd-git](https://aur.archlinux.org/packages/sxhkd-git/) *(AUR)*
- [ttf-material-design-icons-git](https://aur.archlinux.org/packages/ttf-material-design-icons-git/) *(AUR)*
- [vlc](https://www.archlinux.org/packages/extra/x86_64/vlc/)
- [wmname](https://www.archlinux.org/packages/community/x86_64/wmname/)
- [yay](https://aur.archlinux.org/packages/yay/) *(AUR)*


## installation

To quickly get started using the tools and configuration i am using, here is a script that updates the system, installs the dependencies and tools, and clones this repository into your home directory:

```sh
#!/usr/bin/bash

# update archlinux
sudo pacman -Syu

# install dependencies & tools (extra & community)
sudo pacman -S eog git gnome-calculator gnome-disk-utility gnome-mpv gucharmap maim nautilus noto-fonts-emoji pavucontrol rxvt-unicode slop vlc wmname

# install yay (aur-helper)
TEMP_DIRECTORY_YAY=$(mktemp -d)
git clone https://aur.archlinux.org/yay.git $TEMP_DIRECTORY_YAY
cd $TEMP_DIRECTORY_YAY
makepkg -si

# install dependencies & tools (aur)
yay -S bspwm-git compton-git giph-git google-chrome-dev jetbrains-toolbox polybar-git rofi-git sxhkd-git ttf-material-design-icons-git

# install dotfiles
TEMP_DIRECTORY_DOTFILES=$(mktemp -d)
git clone git@github.com:phisch/dotfiles.git $TEMP_DIRECTORY_DOTFILES
shopt -s dotglob
mv -b $TEMP_DIRECTORY_DOTFILES/* ~/test
```

### `~` is a git repository
Yes, my home directory is a git repository! And the `.gitignore` file ignores everything. 

To add a new file to the repository, it has to be force added with `git add --force .new_dotfile`.

This way configuration **changes can be easily detected and committed**, and **nothing gets added accidentally**.