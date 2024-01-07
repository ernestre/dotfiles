{ pkgs, ... }:
let
  font = import ../../../commons/fonts.nix;
in
{
  # https://github.com/nix-community/home-manager/blob/master/modules/services/dunst.nix
  services.dunst =
    let
      background = "#2a2f38";
      foreground = "#f1fffa";
      timeout = 5;
    in
    {

      enable = true;

      settings = {

        global = {
          width = 500;
          height = 300;
          font = "${font.name} ${font.size}";
        };

        urgency_low = { inherit background foreground timeout; };
        urgency_normal = { inherit background foreground timeout; };

        urgency_critical = {
          background = "#900000";
          foreground = "#ffffff";
          frame_color = "#ff0000";
          timeout = 0;
        };

        Slack = {
          appname = "Slack";
          format = " %s\\n<b>%b</b>";
        };

        Spotify = {
          appname = "Spotify";
          background = "#1DB954";
          foreground = "#191414";
        };
      };
    };
}
