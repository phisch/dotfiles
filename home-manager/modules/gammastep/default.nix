{pkgs, ...}: {
  services.gammastep = {
    enable = true;
    temperature = {
      day = 5800;
      night = 3300;
    };
    latitude = "49.452103";
    longitude = "11.076665";

    settings = {
      general = {
        fade = 1;
        adjustment-method = "wayland";
      };
    };
  };
}