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
  home.homeDirectory = "/Users/erre";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  # This doesn't work with a flake
  # nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkg: true);

  home.packages = with pkgs; [
    git
    tmux
    fzf
    fd
    ripgrep
    tree
    go

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