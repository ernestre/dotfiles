{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/master";
    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "github:nix-community/home-manager/release-25.11";
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
        kitty = import ./nixpkgs/home-manager/modules/kitty;
        picom = import ./nixpkgs/home-manager/modules/picom;
        nexos-vibecoding = import ./nixpkgs/home-manager/modules/nexos-vibecoding;
      };

      homeConfigurations = {
        erre = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./nixpkgs/home-manager/erre.nix ];
          extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.x86_64-linux; };
        };
      };

      nixosConfigurations = {
        pc = nixosConfig ./nixpkgs/nixos/pc/configuration.nix;
        lenovo = nixosConfig ./nixpkgs/nixos/lenovo/configuration.nix;
        thinkpad = nixosConfig ./nixpkgs/nixos/thinkpad/configuration.nix;
      };
    };
}
