{ pkgs, ... }:
let
  # because of retina
  size = if pkgs.stdenv.isDarwin then 18 else 13.5;
in
{
  home.file.".config/alacritty/alacritty.yml".text = pkgs.lib.generators.toYAML { }
    {
      env = {
        WINIT_X11_SCALE_FACTOR = "1";
      };
      font = {
        normal = {
          family = "UbuntuMono Nerd Font";
          style = "Regular";
        };
        inherit size;
      };
      colors = {
        primary = {
          background = "#2a2f38";
          foreground = "#f1fffa";
        };
      };
    };
}
