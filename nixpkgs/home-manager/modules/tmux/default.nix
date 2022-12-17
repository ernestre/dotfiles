{ pkgs, lib, ... }:
{
  home.file.".tmux.conf".source = ./.tmux.conf;
}
