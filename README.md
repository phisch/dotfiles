
sudo nixos-rebuild switch --flake ./nix#tower

nix shell nixpkgs#home-manager

home-manager switch --flake ./nix#phisch@tower