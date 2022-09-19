{ config, pkgs, lib, ... }:

let
  vimsettings = import ./neovim.nix;
  zshSettings = import ./zsh.nix;
in {
  home.username = "erre";
  home.homeDirectory = "/home/erre";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

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

    nodejs-16_x
    nodePackages."intelephense"
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    nodePackages."vscode-langservers-extracted"
    nodePackages."yaml-language-server"
  ];

  programs.bottom.enable = true;
  programs.bat.enable = true;

  programs.git = {
    delta = { enable = true; };

    enable = true;
    # userEmail = "ernest.rekel@gmail.com";
    # userName = "Ernest Rekel";
    #
    # extraConfig = {
    #   branch.autosetuprebase = "always";
    #   color.ui = true;
    #   diff.colorMoved = "zebra";
    #   fetch.prune = true;
    #   github.user = "ernestre";
    #   init.defaultBranch = "main";
    #   pull.rebase = true;
    #   push.default = "tracking";
    #   rebase.autoStash = true;
    # };

  };
  home.file.".gitconfig".source = ./.gitconfig;

  programs.neovim = vimsettings pkgs;
  home.file.".vimrc".source = ./.vimrc;
  home.file.".vim".source = ./vim;

  programs.zsh = zshSettings pkgs;
  home.file.".tmux.conf".source = ./.tmux.conf;
}
