{ config, pkgs, lib, ... }: rec {
  programs.password-store = {
    enable = true;
  };

  programs.browserpass = {
    enable = true;
    browsers = [ "chromium" "firefox" ];
  };

  programs.firefox.profiles."phisch".extensions =
    [ config.nur.repos.rycee.firefox-addons.browserpass ];

  programs.chromium.extensions =
    [ { id = "naepdomgkenhinolocfifgehidddafch"; } ];
}
 