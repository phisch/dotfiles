{ inputs, lib, config, pkgs, ... }: {
  programs.gpg = {
    enable = true;
    publicKeys = [
      {
        source = ./public-keys.asc;
        trust = "ultimate";
      }
    ];
  };

  programs.nushell.extraEnv = ''
    let-env GPG_TTY = (tty)
    let-env SSH_AUTH_SOCK = (${pkgs.gnupg}/bin/gpgconf --list-dirs agent-ssh-socket)
    gpg-connect-agent updatestartuptty /bye out> /dev/null
  '';

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentryFlavor = "gnome3";
    defaultCacheTtl = 60;
    maxCacheTtl = 120;
  };
}
