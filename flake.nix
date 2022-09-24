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
    };
}
