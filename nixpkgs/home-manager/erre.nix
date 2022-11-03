{ config, pkgs, lib, ... }:
{
  imports = [
    ./modules/neovim
    ./modules/zsh
    ./modules/git
    ./modules/tmux
    ./modules/rofi
    ./modules/alacritty
  ];

  home.username = "erre";
  home.homeDirectory = "/home/erre";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  home.file.".background-image".source = ../../wallpapers/porsche.png;

  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  home.packages = with pkgs; [
    alacritty
    fd
    fzf
    gcc
    git
    gnumake
    go
    gopass
    jq
    just
    pwgen
    ripgrep
    rofi
    terraform
    tmux
    tree
    xclip
    yq-go
    kubectl
    kind
    k9s

    nodejs-16_x
    nodePackages."intelephense"
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    nodePackages."vscode-langservers-extracted"
    nodePackages."yaml-language-server"
  ];

  programs.bottom.enable = true;
  programs.bat.enable = true;
}
