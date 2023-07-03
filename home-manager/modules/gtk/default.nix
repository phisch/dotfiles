{ pkgs, ... }: {
  gtk = {
    enable = true;

    theme = let
      phocus = pkgs.stdenvNoCC.mkDerivation {
        name = "phocus";

        src = builtins.fetchTarball {
          url = "https://github.com/phocus/gtk/archive/0cf0eb35a927bffcb797db8a074ce240823d92de.tar.gz";
          sha256 = "1fbjfjwh2an3cfm862skx2mdd49p8hyr7rpfz994whsijl6ah6si";
        };

        patches = [
          ./patches/remove-npm-install.diff
        ];

        nativeBuildInputs = [
          pkgs.nodePackages.sass
        ];

        installFlags = [
          "DESTDIR=$(out)"
          "PREFIX="
        ];
      };
    in {
      package = phocus;
      name = "phocus";
    };
  };

  home.file.".config/gtk-4.0/gtk.css".source = gtk4/gtk.css;
}
