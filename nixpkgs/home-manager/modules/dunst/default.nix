{ pkgs, lib, ... }:
{
  home.file.".config/dunst".source = ./config;
}
