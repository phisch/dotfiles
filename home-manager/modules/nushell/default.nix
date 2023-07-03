{ pkgs, ... }: {
  home.packages = [ pkgs.carapace ];

  programs.nushell = {
    enable = true;
    configFile.source = config/config.nu;
    envFile.source = config/env.nu;
  };
  
  home.file.".config/nushell/login.nu".source = config/login.nu;
}
 