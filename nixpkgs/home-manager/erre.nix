{ pkgs, ... }:
{
  imports = [
    ./modules/alacritty
    ./modules/common.nix
    ./modules/dunst
    ./modules/git
    ./modules/i3
    ./modules/neovim
    ./modules/rofi
    ./modules/tmux
    ./modules/zsh
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
    dunst

    autorandr
  ];

  services.dunst.enable = true;

  xsession.windowManager.i3 = {
    config = {
      startup = [
        { command = "tdesktop"; notification = false; }
        { command = "discord"; notification = false; }
        { command = "autorandr -c"; notification = false; }
      ];
    };
  };
}
