{
  description = "phischs config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = github:nix-community/NUR;
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nur, ... }@inputs: {
    # Available through 'nixos-rebuild switch --flake .#tower'
    nixosConfigurations = {
      tower = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./nixos/configuration.nix ];
      };
    };
    # Available through 'home-manager switch --flake .#phisch@tower'
    homeConfigurations = {
      "phisch@tower" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {
          inherit inputs;
          rootPath = ./.;
        };
        modules = [ ./home-manager/home.nix nur.nixosModules.nur ];
      };
    };
  };
}