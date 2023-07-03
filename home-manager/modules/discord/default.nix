{ inputs, lib, config, pkgs, ... }: {
  # Doesn't load Krisp module. This can be patched by running:
  # nix run github:steinerkelvin/dotfiles#discord-krisp-patch
  # For more context, read: https://github.com/NixOS/nixpkgs/issues/195512
  home.packages = with pkgs; [
    xdg-utils
    (
      pkgs.discord.override {
        withOpenASAR = true;
      }
    )
  ];
}
