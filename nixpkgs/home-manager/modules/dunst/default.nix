{ pkgs, ... }:
{
  home.packages = with pkgs; [ dunst ];
  services.dunst.enable = true;
  home.file.".config/dunst".source = ./config;
}
