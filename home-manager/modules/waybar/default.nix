{ inputs, lib, config, pkgs, ... }: {
  programs.waybar = {
    enable = true;

    settings = [
      {
        position = "top";
        height = 38;
        spacing = 0;
        mode = "dock";
        fixed-center = false;
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "clock" "cpu" "tray" ];
        "sway/window" = {
          max-length = 50;
          max-length-mode = "middle";
          tooltip = true;
        };
        "sway/workspaces" = {
          disable-scroll = false;
          all-outputs = false;
          format = "";
          persistent_workspaces = {
            "1" = [ "eDP-1" "DP-6" ];
            "2" = [ "eDP-1" "DP-6" ];
            "3" = [ "eDP-1" "DP-6" ];
            "4" = [ "eDP-1" "DP-6" ];
            "5" = [ "eDP-1" "DP-6" ];
            "6" = [ "DP-1" "DP-6" ];
            "7" = [ "DP-1" ];
            "8" = [ "DP-1" ];
            "9" = [ "DP-1" ];
            "10" = [ "DP-1" ];
          };
        };
        "tray" = {
          spacing = 10;
        };
        "clock" = {
          timezone = "Europe/Berlin";
          format = "󰅐 {:%a %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "󰅐 {:%a %d.%m.%Y %H:%M}";
        };
        "cpu" = {
          format = "󰘚 {usage}%";
          tooltip = true;
        };
      }
    ];

    style = ''
      * {
        font-family: MaterialDesignIcons, DejaVuSans, sans-serif;
        font-size: 13px;
      }

      window#waybar {
        background-color: transparent;
        color: rgba(255, 255, 255, 0.87);
      }

      button {
        border: none;
        border-radius: 0;
        transition: background ease-in-out 0.2s;
      }

      button:hover {
        background: rgba(255, 255, 255, 0.06);
      }

      #workspaces button {
        padding: 0;
      }

      #workspaces button label {
        background: rgba(255, 255, 255, 0.14);
        font-size: 0;
        color: transparent;
        min-width: 10px;
        min-height: 10px;
        margin: 1rem 0.8rem;
        padding: 1px;
        border-radius: 3px;
      }

      #workspaces button.persistent label {
        padding: 0;
        background: transparent;
        border: 1px solid rgba(255, 255, 255, 0.14);
      }

      #workspaces button.focused label {
        background: rgba(255, 255, 255, 0.87);
      }

      #workspaces button.urgent label {
        background: #E36D6D;
      }

      .modules-right widget>* {
        padding: 0 0.8em;
      }

      widget #tray {
        padding: 0;
      }

      #battery.critical {
        background: rgba(218, 88, 88, 0.3);
      }
    '';
  };
}
 