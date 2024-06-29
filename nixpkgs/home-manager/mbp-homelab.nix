{ pkgs, ... }:
{
  imports = [
    ./modules/common.nix
    ./modules/git
    ./modules/neovim
    ./modules/zsh
  ];

  home.username = "erre";
  home.homeDirectory = "/home/erre";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  home.packages = with pkgs; [
    gcc

    trash-cli

    ansible
  ];
}
