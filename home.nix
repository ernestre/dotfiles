{ config, pkgs, lib, ... }:

let
  vimsettings = import ./neovim.nix;
  zshSettings = import ./zsh.nix;
in {
  home.username = "erre";
  home.homeDirectory = "/home/erre";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git
    pass
    tmux
    fzf
    fd
    ripgrep
    tree
    go
    gcc
    xclip
  ];

  programs.bottom.enable = true;
  programs.bat.enable = true;

  programs.git = {
    delta = { enable = true; };

    enable = true;
    userEmail = "ernest.rekel@gmail.com";
    userName = "Ernest Rekel";

    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      diff.colorMoved = "zebra";
      fetch.prune = true;
      github.user = "ernestre";
      init.defaultBranch = "main";
      pull.rebase = true;
      push.default = "tracking";
      rebase.autoStash = true;
    };
  };

  programs.neovim = vimsettings pkgs;
  home.file.".vimrc".source = ./.vimrc;

  programs.zsh = zshSettings pkgs;
}
