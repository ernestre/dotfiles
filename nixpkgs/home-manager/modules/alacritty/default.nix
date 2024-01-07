{ ... }:
let
  font = import ../../../commons/fonts.nix;
in
{
  home.file.".config/alacritty/alacritty.toml".text = ''
    [colors.primary]
    background = "#2a2f38"
    foreground = "#f1fffa"

    [env]
    WINIT_X11_SCALE_FACTOR = "1"

    [font]
    size = ${font.size}

    [font.normal]
    family = "${font.name}"
    style = "Regular"

    [window]
    startup_mode = "Maximized"
  '';
}
