{
  description = "NIXOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, systems, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "sonarpinger";
      user = {
        email = "sonarwaver@gmail.com";
      };

      configPath = "/etc/nixos";
      pkgs-unstable = import nixpkgs-unstable {
        system = system;
        config.allowUnfree = true;
      };
      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = eachSystem (pkgs:
        import ./devshells.nix { inherit pkgs; lib = nixpkgs.lib; }
      );
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit
              inputs
              username
              user
              configPath
              pkgs-unstable;
          };
          modules = [
            ./hosts/laptop/default.nix
            ./overlays/default.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
