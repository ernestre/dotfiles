{ pkgs, lib, ... }:
{
  home.file.".config/alacritty".source = ./config;
}
