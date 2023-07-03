{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./alacritty
    ./sway
    ./wofi
    ./waybar
    ./gpg
    ./git
    ./cursor
    ./wallpaper
    ./firefox
    ./discord
    ./starship
    ./vscode
    ./pass
    ./chromium
    ./nushell
    ./gtk
    ./gammastep
  ];
}