{ pkgs, ... }: let
  cursor-theme = "phinger-cursors-light";
  cursor-size = 32;
in {
  home.pointerCursor = {
    name = "${cursor-theme}";
    package = pkgs.phinger-cursors;
  };

  dconf.settings."org/gnome/desktop/interface" = {
    cursor-size = cursor-size;
    cursor-theme = cursor-theme;
  };

  wayland.windowManager.sway.config.seat = {
    "*" = {
      xcursor_theme = "${cursor-theme} ${toString cursor-size}";
    };
  };
}
 