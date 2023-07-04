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

  programs.nushell.environmentVariables = {
    GPT_TTY = "(tty)";
    SSH_AUTH_SOCK = "(${pkgs.gnupg}/bin/gpgconf --list-dirs agent-ssh-socket)";
  };

  programs.nushell.extraEnv = ''
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
