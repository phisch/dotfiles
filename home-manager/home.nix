{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./modules
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "phisch";
    homeDirectory = "/home/phisch";
  };

  home.packages = with pkgs; [
    jq
    font-manager
    chromium
    vscode
    #jetbrains-mono
    #material-design-icons
    grim
    slurp
    wl-clipboard
    teamspeak_client
    pavucontrol
    gnome.nautilus
    xdg-utils
  ];

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;


  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}