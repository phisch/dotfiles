{ rootPath, ... }: {
  home.file."Pictures/wallpapers".source = rootPath + /wallpapers;

  wayland.windowManager.sway.config.output = {
    "*" = {
      bg = "~/Pictures/wallpapers/grape.png fill";
    };
  };
}
 