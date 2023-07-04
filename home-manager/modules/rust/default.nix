{ pkgs, ... }: {
  home.packages = with pkgs; [
    rustup
  ];

  programs.nushell.extraEnv = "let-env PATH = ($env.PATH | append '~/.cargo/bin')";
}