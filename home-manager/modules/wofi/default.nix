{ inputs, lib, config, pkgs, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      orientation = "horizontal";
      width = "100%";
      height = 38;
      image_size = 16;
      allow_images = true;
      y = -38;
      global_coords = true;
      hide_scroll = true;
      no_actions = true;
      prompt = "";
      normal_window = false;
      content_halign = "center";
      halign = "start";
    };
    style = ''
      #window {
        font-size: 14px;
        background: transparent;
        background-image: url("/home/phisch/Pictures/wallpapers/grape.png");
        background-position: 0 0;
        background-origin: content-box;
        background-repeat: no-repeat;
        background-size: cover;
        color: rgba(255,255,255,0.3);
      }

      #outer-box {
        background-image: linear-gradient(to right, rgba(0, 0, 0, 0.4), transparent, transparent);
      }

      #input {
        border-radius: 0;
        border: 0;
        box-shadow: none;
        background: transparent;
      }

      #entry {
        background: transparent;
        padding: 7px 1em 8px;
        outline: 0;
      }

      #entry:selected {
        background: rgba(255, 255, 255, 0.1);
      }

      #img {
        margin-right: 0.5em;
      }
    '';
  };
}
 