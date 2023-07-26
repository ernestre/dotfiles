{ pkgs, ... }:
let
  i3_mod = "Mod1";
  fonts = import ../../../commons/fonts.nix;
  i3_fonts = {
    names = [ fonts.name ];
    size = 8.0;
  };
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      startup = [
        { command = "xss-lock --transfer-sleep-lock -- i3lock --nofork"; notification = false; }
        { command = "nm-applet"; notification = false; }
        { command = "spotify"; notification = false; }
        { command = "xset -dpms && xset s off"; notification = false; }
        { command = "${pkgs.feh}/bin/feh --bg-center ~/dotfiles/wallpapers/main.png"; notification = false; }
      ];

      fonts = i3_fonts;

      bars = [{
        fonts = i3_fonts;

        statusCommand = "${pkgs.i3status}/bin/i3status";

        colors = {
          background = "#2a2f38";
          statusline = "#f1fffa";

          focusedWorkspace = {
            background = "#3772ff";
            border = "#3772ff";
            text = "#f1fffa";
          };
          activeWorkspace = {
            background = "#f1fffa";
            border = "#3772ff";
            text = "#f1fffa";
          };
          inactiveWorkspace = {
            background = "#2a2f38";
            border = "#2a2f38";
            text = "#f1fffa";
          };
          urgentWorkspace = {
            background = "#b80c09";
            border = "#3772ff";
            text = "#f1fffa";
          };
        };
      }];

      keybindings = {
        "XF86AudioRaiseVolume" = "exec --no-startup-id amixer -D pulse set Master 10%+ && $refresh_i3status";
        "XF86AudioLowerVolume" = "exec --no-startup-id amixer -D pulse set Master 10%- && $refresh_i3status";
        "XF86AudioMute" = "exec --no-startup-id amixer -D pulse set Master toggle && $refresh_i3status";
        "XF86AudioMicMute" = "exec --no-startup-id amixer -D pulse set Capture toggle && $refresh_i3status";
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        "${i3_mod}+Shift+f" = "exec playerctl play-pause";
        "${i3_mod}+Shift+d" = "exec playerctl next";
        "${i3_mod}+Shift+s" = "exec playerctl previous";

        "${i3_mod}+Shift+minus" = "move scratchpad";
        "${i3_mod}+minus" = "scratchpad show";
        "${i3_mod}+Return" = "exec --no-startup-id alacritty";
        "${i3_mod}+Shift+q" = "kill";
        "${i3_mod}+d" = "exec rofi -show drun -show-icons -modi drun";
        "${i3_mod}+w" = "exec rofi -show window -show-icons";
        "${i3_mod}+p" = "exec gopass ls --flat | rofi -dmenu -p gopass | xargs --no-run-if-empty gopass -c";
        "${i3_mod}+u" = "exec gopass ls --flat | rofi -dmenu -p gopass | xargs -i --no-run-if-empty gopass -c {} user";
        "${i3_mod}+o" = "exec gopass ls --flat | rofi -dmenu -p gopass | xargs --no-run-if-empty gopass otp -c";
        "${i3_mod}+Shift+o" = "exec --no-startup-id maim --select | xclip -selection clipboard -t image/png";
        "${i3_mod}+Shift+p" = "exec --no-startup-id maim | xclip -selection clipboard -t image/png";

        "${i3_mod}+h" = "focus left";
        "${i3_mod}+j" = "focus down";
        "${i3_mod}+k" = "focus up";
        "${i3_mod}+l" = "focus right";
        "${i3_mod}+Left" = "focus left";
        "${i3_mod}+Down" = "focus down";
        "${i3_mod}+Up" = "focus up";
        "${i3_mod}+Right" = "focus right";
        "${i3_mod}+Shift+h" = "move left";
        "${i3_mod}+Shift+j" = "move down";
        "${i3_mod}+Shift+k" = "move up";
        "${i3_mod}+Shift+l" = "move right";
        "${i3_mod}+Shift+Left" = "move left";
        "${i3_mod}+Shift+Down" = "move down";
        "${i3_mod}+Shift+Up" = "move up";
        "${i3_mod}+Shift+Right" = "move right";
        "${i3_mod}+f" = "fullscreen toggle";
        "${i3_mod}+Shift+space" = "floating toggle";
        "${i3_mod}+space" = "focus mode_toggle";
        "${i3_mod}+a" = "focus parent";

        "${i3_mod}+1" = "workspace 1";
        "${i3_mod}+2" = "workspace 2";
        "${i3_mod}+3" = "workspace 3";
        "${i3_mod}+4" = "workspace 4";
        "${i3_mod}+5" = "workspace 5";
        "${i3_mod}+6" = "workspace 6";
        "${i3_mod}+7" = "workspace 7";
        "${i3_mod}+8" = "workspace 8";
        "${i3_mod}+9" = "workspace 9";
        "${i3_mod}+0" = "workspace 10";

        "${i3_mod}+Shift+1" = "move container to workspace number 1";
        "${i3_mod}+Shift+2" = "move container to workspace number 2";
        "${i3_mod}+Shift+3" = "move container to workspace number 3";
        "${i3_mod}+Shift+4" = "move container to workspace number 4";
        "${i3_mod}+Shift+5" = "move container to workspace number 5";
        "${i3_mod}+Shift+6" = "move container to workspace number 6";
        "${i3_mod}+Shift+7" = "move container to workspace number 7";
        "${i3_mod}+Shift+8" = "move container to workspace number 8";
        "${i3_mod}+Shift+9" = "move container to workspace number 9";
        "${i3_mod}+Shift+0" = "move container to workspace number 10";

        "Mod4+l" = "exec ~/dotfiles/scripts/i3/lock.sh";

        "${i3_mod}+Shift+c" = "reload";
        "${i3_mod}+Shift+r" = "restart";
        "${i3_mod}+Shift+e" = "exec \"i3-nagbar - t warning - m 'You pressed the exit shortcut.Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'\"";
        "${i3_mod}+r" = "mode \" resize \"";
      };

      modifier = i3_mod;

      assigns = {
        "1" = [
          { class = "Chromium"; }
          { class = "firefox"; }
          { class = "Google-chrome"; }
          { class = "Brave-browser"; }
        ];
        "3" = [
          { class = "Slack"; }
          { class = "discord"; }
        ];
        "5" = [
          { class = "Mailspring"; }
        ];
      };

      floating = {
        border = 0;
        criteria = [
          { class = "TelegramDesktop"; }
          { class = "Org.gnome.Nautilus"; instance = "org.gnome.Nautilus"; }
        ];
        titlebar = false;
      };

      window = {
        border = 0;
        hideEdgeBorders = "none";
        titlebar = false;
      };
    };

    extraConfig = ''
      for_window [class="Spotify"] move to workspace 4
    '';
  };
}
