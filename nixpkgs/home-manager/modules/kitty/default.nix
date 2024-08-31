{ ... }:
let
  font = import ../../../commons/fonts.nix;
in
{
  home.file.".config/kitty/kitty.conf".text = ''
    font_family      ${font.name}
    bold_font        ${font.name}
    italic_font      ${font.name}
    bold_italic_font ${font.name}

    font_size 13.0

    foreground #f1fffa
    background #2a2f38

    background_opacity 1

    term xterm-kitty

    env TERMINFO_DIRS=/usr/share/terminfo:/etc/terminfo:/lib/terminfo
  '';
}
