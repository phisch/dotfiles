{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs
  ];

  programs.nushell.environmentVariables = {
    NPM_PACKAGES = "~/.npm-packages";
  };

  programs.nushell.extraEnv = "let-env PATH = ($env.PATH | append '~/.npm-packages/bin')";
}