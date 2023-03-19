{ pkgs, lib, ... }:
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
        size = 12.5;
      };
      colors = {
        primary = {
          background = "#2a2f38";
          foreground = "#f1fffa";
        };
      };
    };
}
