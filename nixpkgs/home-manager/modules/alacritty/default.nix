{ config, lib, pkgs, ... }:
with lib;
let
  # because of retina
  size = if pkgs.stdenv.isDarwin then 16 else 10;
  fonts = import ../../../commons/fonts.nix;
in
{
  options = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = lib.mdDoc ''
        Whether to enable personal Alacritty config.
      '';
    };

    customConfig = mkOption {
      type = types.attrs;
      default = { };
      description = lib.mdDoc ''
        Override default config with custom values. i.e different font or font size.
      '';
    };
  };

  config = mkIf config.enable {
    home.file.".config/alacritty/alacritty.yml".text = pkgs.lib.generators.toYAML { }
      (
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
        } //
        config.customConfig
      );
  };
}
