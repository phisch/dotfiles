{ inputs, lib, config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      window =  {
        padding = {
          x = 16;
          y = 16;
        };
        dynamic_padding = true;
        dynamic_title = true;
        opacity = 0.96;
      };
      font =  {
        normal =  {
          family = "JetBrains Mono";
        };
        size = 12;
      };
      cursor = {
        style = {
          shape = "Underline";
          blinking = "On";
        };
      };
      colors = {
        primary.background = "#0a0a0a";
        normal = {
          black = "#000000";
          red = "#DA5858";
          yellow = "#E8CA5E";
          green = "#3FC661";
          cyan = "#5CD8E6";
          blue = "#497EE9";
          magenta = "#7154F2";
          white = "#e6e6e6";
        };
        bright = {
          black = "#4d4d4d";
          red = "#E36D6D";
          yellow = "#FADD75";
          green = "#61D67E";
          cyan = "#7EEAF6";
          blue = "#5D8DEE";
          magenta = "#8066F5";
          white = "#ffffff";
        };
      };
      key_bindings =  [
        {
          key = "Up";
          mods = "Control";
          action = "ScrollPageUp";
        }
        {
          key = "Down";
          mods = "Control";
          action = "ScrollPageDown";
        }
      ];
    };
  };
}