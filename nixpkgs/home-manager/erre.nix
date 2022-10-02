{ config, pkgs, lib, ... }:
{
    imports = [
        ./modules/neovim/neovim.nix
        ./modules/zsh/zsh.nix
        ./modules/git/git.nix
        ./modules/tmux/tmux.nix

        ./modules/fonts/fonts.nix
    ];

  home.username = "erre";
  home.homeDirectory = "/home/erre";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  # This doesn't work with a flake
  # nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

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
    just
    terraform

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
