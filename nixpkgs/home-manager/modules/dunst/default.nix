{ pkgs, ... }:
let
  font = import ../../../commons/fonts.nix;
in
{
  # https://github.com/nix-community/home-manager/blob/master/modules/services/dunst.nix
  services.dunst =
    let
      background = "#1a1d23e6";
      foreground = "#ffffff";
      frame_color = "#ffffff";
      highlight = "#0072cee6";
      timeout = 5;
    in
    {

      enable = true;

      settings = {

        global = {
          hide_duplicate_count = true;
          width = "(350, 450)";
          height = 120;
          origin = "top-right";
          offset = "20x20";
          font = "${font.name} ${font.size}";
          format = "<b>%s</b>\\n%b";
          alignment = "left";
          vertical_alignment = "center";
          icon_position = "left";
          max_icon_size = 48;
          corner_radius = 12;
          frame_width = 2;
          separator_height = 2;
          separator_color = "auto";
          padding = 16;
          horizontal_padding = 16;
          gap_size = 8;
          progress_bar_corner_radius = 4;
          indicate_hidden = "yes";
          show_indicators = "no";
          mouse_left_click = "close_current";
          mouse_right_click = "close_all";
          inherit background foreground timeout frame_color;
        };

        urgency_critical = {
          background = "#1a1d23e6";
          foreground = "#ffffff";
          frame_color = "#e74c3c";
          timeout = 0;
        };

        Slack = {
          appname = "Slack";
          format = " %s\\n<b>%b</b>";
        };

        Spotify = {
          appname = "Spotify";
          background = "#1DB954e6";
          foreground = "#ffffff";
        };
      };
    };
}
