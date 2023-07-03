{ inputs, lib, config, pkgs, ... }: {
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = ./public-keys.asc;
        trust = "ultimate";
      }
    ];
  };
  
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "gnome3";
    defaultCacheTtl = 60;
    maxCacheTtl = 120;
  };
}
