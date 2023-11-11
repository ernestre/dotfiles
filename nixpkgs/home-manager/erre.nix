{ pkgs, ... }:
{
  imports = [
    ./modules/alacritty
    ./modules/common.nix
    ./modules/git
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
    insomnia

    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.aylurs-widgets

    # tiling?
    gnomeExtensions.pop-shell
    gnomeExtensions.top-bar-organizer
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.user-themes
    gnomeExtensions.vitals
  ];

  dconf.settings = {
    # ...
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
  };

  services.dunst.enable = true;

  xsession.windowManager.i3 = {
    config = {
      startup = [
        { command = "telegram-desktop"; notification = false; }
        { command = "discord"; notification = false; }
        { command = "autorandr -c"; notification = false; }
      ];
    };
  };
}
