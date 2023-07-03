{ config, ... }: {

  programs.firefox = {
    enable = true;

    profiles = {
      "phisch" = {
        settings = {
          "browser.startup.page" = 3;
          "browser.newtabpage.pinned" = [
            {
              label = "GitHub";
              url = "https://github.com";
            }
            {
              label = "Phind";
              url = "https://phind.com";
            }
            {
              label = "YouTube";
              url = "https://youtube.com";
            }
            {
              label = "Ebay";
              url = "https://ebay.de";
            }
            {
              label = "Kleinanzeigen";
              url = "https://kleinanzeigen.de";
            }
            {
              label = "Reddit";
              url = "https://reddit.com";
            }
            {
              label = "Gmail";
              url = "https://gmail.com";
            }
            {
              label = "Wayland";
              url = "https://wayland.app";
            }
          ];
        };
        extensions = with config.nur.repos.rycee.firefox-addons; [
          darkreader
          h264ify
          istilldontcareaboutcookies
          sponsorblock
          ublock-origin
        ];
      };
    };
  };
}
 