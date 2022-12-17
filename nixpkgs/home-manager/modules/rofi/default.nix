{ pkgs, lib, ... }:
{
  home.file.".config/rofi".source = ./config;
}
