{ pkgs, ... }:
let
  # because of retina
  size = if pkgs.stdenv.isDarwin then 16 else 10;
  fonts = import ../../../commons/fonts.nix;
in
{
  home.file.".config/alacritty/alacritty.yml".text = pkgs.lib.generators.toYAML { }
    {
      env = {
        WINIT_X11_SCALE_FACTOR = "1";
      };
      font = {
        normal = {
          family = fonts.name;
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
      window = {
        startup_mode = "Maximized";
      };
    };
}
