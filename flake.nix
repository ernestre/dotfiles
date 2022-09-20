{
  description = "Personal setup flake";

  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      hardware.url = "github:nixos/nixos-hardware";

      home-manager.url = "github:nix-community/home-manager";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = { nixpkgs, home-manager, ... }@inputs: rec {
    legacyPackages = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ] (system:
      import inputs.nixpkgs {
        inherit system;

        config.allowUnfree = true;
      }
    );

    homeConfigurations = {
      # FIXME replace with your username@hostname
      "erre@erre-VirtualBox" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = [ ./home.nix ];
        };
    };
  };
}
