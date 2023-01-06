{ config, pkgs, lib, ... }:
{
  imports = [
    ./modules/neovim
    ./modules/zsh
    ./modules/git
    ./modules/tmux
    ./modules/alacritty
    ./modules/common.nix
  ];

  home.username = "erre";
  home.homeDirectory = "/Users/erre";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  programs.bottom.enable = true;
  programs.bat.enable = true;
}
