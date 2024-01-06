{ pkgs, ... }:
{
  home.file.".config/rofi".source = ./config;

  home.packages = with pkgs; [
    rofi
  ];
}
