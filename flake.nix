{
  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/master";
    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nixpkgsUnstable, home-manager }:
    let
      nixosConfig = configurationPath: inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { common = self.common; inherit inputs; };
        modules = [
          configurationPath
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.x86_64-linux; };
            # TODO load home-manager dotfiles also for root user
            home-manager.users.erre = import ./nixpkgs/home-manager/erre.nix;
          }
        ];
      };
    in
    {
      modules = {
        alacritty = import ./nixpkgs/home-manager/modules/alacritty;
        common = import ./nixpkgs/home-manager/modules/common.nix;
        dunst = import ./nixpkgs/home-manager/modules/dunst;
        git = import ./nixpkgs/home-manager/modules/git;
        gnome = import ./nixpkgs/home-manager/modules/gnome;
        i3 = import ./nixpkgs/home-manager/modules/i3;
        neovim = import ./nixpkgs/home-manager/modules/neovim;
        profile = import ./nixpkgs/home-manager/modules/profile;
        rofi = import ./nixpkgs/home-manager/modules/rofi;
        tmux = import ./nixpkgs/home-manager/modules/tmux;
        zsh = import ./nixpkgs/home-manager/modules/zsh;
      };

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
        pc = nixosConfig ./nixpkgs/nixos/pc/configuration.nix;
        lenovo = nixosConfig ./nixpkgs/nixos/lenovo/configuration.nix;
      };
    };
}
