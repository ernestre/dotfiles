{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd
    fzf
    git
    gnumake
    go
    gopass
    jq
    just
    pwgen
    ripgrep
    terraform
    tmux
    tree
    yq-go

    nodejs-16_x
    nodePackages."intelephense"
    nodePackages."typescript"
    nodePackages."typescript-language-server"
    nodePackages."vscode-langservers-extracted"
    nodePackages."yaml-language-server"
  ];
}
