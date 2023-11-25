{ pkgs, ... }:
{
  imports = [
    ./modules/alacritty
    ./modules/common.nix
    ./modules/git
    ./modules/gnome
    ./modules/neovim
    ./modules/tmux
    ./modules/zsh
  ];

  home.username = "erre";
  home.homeDirectory = "/home/erre";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  home.packages = with pkgs; [
    gcc
    xclip
    kubectl
    kind
    k9s
  ];
}
