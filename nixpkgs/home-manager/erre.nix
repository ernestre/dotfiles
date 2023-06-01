{ config, pkgs, lib, ... }:
{
  imports = [
    ./modules/neovim
    ./modules/zsh
    ./modules/git
    ./modules/tmux
    ./modules/rofi
    ./modules/common.nix
    ./modules/alacritty
    ./modules/i3
  ];

  home.username = "erre";
  home.homeDirectory = "/home/erre";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  home.packages = with pkgs; [
    alacritty
    gcc
    rofi
    xclip
    kubectl
    kind
    k9s
    maim
    feh

    font-awesome
    (nerdfonts.override { fonts = [ "UbuntuMono" ]; })
  ];

  programs.bottom.enable = true;
  programs.bat.enable = true;

  fonts.fontconfig.enable = true;
}
