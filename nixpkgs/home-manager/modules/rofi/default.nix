{ pkgs, ... }:
let
  font = import ../../../commons/fonts.nix;
in
{
  programs.rofi = {
    enable = true;

    font = "${font.name} ${font.size}";

    plugins = with pkgs; [ rofi-calc ];
  };
}
