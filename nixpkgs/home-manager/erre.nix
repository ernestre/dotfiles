{ pkgs, ... }:
{
  imports = [
    ./modules/kitty
    ./modules/common.nix
    ./modules/git
    ./modules/neovim
    ./modules/tmux
    ./modules/zsh
  ];

  home.username = "nixlab";
  home.homeDirectory = "/home/nixlab";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  home.packages = with pkgs; [
    gcc
    xclip
    kubectl
    kind
    k9s

    trash-cli
  ];
}
