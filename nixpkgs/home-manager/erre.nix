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
    git
    gopass
    alacritty
    tmux
    fzf
    fd
    ripgrep
    tree
    go
    gcc
    xclip
    just
    terraform
    rofi
    pwgen
    yq
    jq

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
