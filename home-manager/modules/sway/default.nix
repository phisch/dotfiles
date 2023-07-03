{ inputs, lib, config, pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "wofi --show drun";
      startup = [
        { command = "firefox"; }
        { command = "alacritty"; }
      ];
      input = {
        "type:keyboard" = {
          xkb_layout = "de(nodeadkeys),de";
          xkb_options = "grp:alt_shift_toggle";
        };
      };

      output = {
        "*" = {
          bg = "~/Pictures/wallpapers/grape.png fill";
        };
        "DP-6" = {
          resolution = "2560x1440@144Hz";

        };
      };

      gaps = {
        smartGaps = true;
        inner = 10;
        outer = -10;
      };

      focus.followMouse = false;

      window = {
        titlebar = false;
        border = 0;
      };

      bars = [
        {
          command = "waybar";
        }
      ];

      keybindings = let
        super = "Mod4";
        alt = "Mod1";
        #next = "$(nu -c 'swaymsg -t get_workspaces | from json | where focused | get name | into int | $in.0 mod 10 + 1')";
        #previous = "$(nu -c 'swaymsg -t get_workspaces | from json | where focused | get name | into int | ($in.0 + 8) mod 10 + 1')";
        next = "$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused).name' | awk '{print $1 % 10 + 1}')";
        previous = "$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused).name' | awk '{print ($1 + 8) % 10 + 1}')";
      in {
        "${super}+Escape" = "reload";
        "${super}+${alt}+Escape" = "exit";

        "${super}+Return" = "exec ${terminal}";
        "${super}+w" = "kill";
        "${super}+Space" = "exec ${menu}";

        "${super}+F11" = "fullscreen";
        "${super}+Control+f" = "fullscreen";
        "${super}+f" = "floating toggle";
        "${super}+s" = "sticky toggle";

        "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 5";
        "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 5";
        "${alt}+Prior" = "exec ${pkgs.light}/bin/light -A 1";
        "${alt}+Next" = "exec ${pkgs.light}/bin/light -U 1";

        "Control_R" = "exec ${pkgs.pamixer}/bin/pamixer --default-source --unmute";
        "--release Control_R" = "exec ${pkgs.pamixer}/bin/pamixer --default-source --mute";

        "${super}+Right" = "exec swaymsg workspace ${next}";
        "${super}+Left" = "exec swaymsg workspace ${previous}";

        "${super}+${alt}+Right" = "exec swaymsg move container to workspace ${next}; exec swaymsg workspace ${next}";
        "${super}+${alt}+Left" = "exec swaymsg move container to workspace ${previous}; exec swaymsg workspace ${previous}";

        "Print" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | tee >(${pkgs.wl-clipboard}/bin/wl-copy -t image/png) ~/Pictures/screenshots/$(date +%s).png";
        "Shift+Print" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | tee >(${pkgs.wl-clipboard}/bin/wl-copy -t image/png) ~/Pictures/screenshots/$(date +%s).png | curl -s -F \"file=@-\" 0x0.st | ${pkgs.wl-clipboard}/bin/wl-copy -p";
      };
    };
  };
}
 