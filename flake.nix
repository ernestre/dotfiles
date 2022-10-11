{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      # url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgsUnstable, home-manager }:
    {
      homeConfigurations = {
        erre = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./nixpkgs/home-manager/erre.nix ];
          extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.x86_64-linux; };
        };

        mbp = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-darwin;
          modules = [ ./nixpkgs/home-manager/mbp.nix ];
          extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.x86_64-darwin; };
        };
      };

      nixosConfigurations = {
        vm = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { common = self.common; inherit inputs; };
          modules = [
            ./nixpkgs/nixos/vm/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.x86_64-linux; };
              # TODO load home-manager dotfiles also for root user
              home-manager.users.erre = import ./nixpkgs/home-manager/erre.nix;
            }
          ];
        };
      };
    };
}
