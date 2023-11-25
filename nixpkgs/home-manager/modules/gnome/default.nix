{ lib, ... }:
{
  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  dconf.settings =
    let
      mkTuple = lib.hm.gvariant.mkTuple;
    in
    {
      "org/gnome/desktop/input-sources" = {
        per-window = true;
        sources = [
          (mkTuple [ "xkb" "us" ])
          (mkTuple [ "xkb" "ru+phonetic_YAZHERTY" ])
        ];
      };

      "org/gnome/desktop/notifications" = {
        show-in-lock-screen = false;
      };

      "org/gnome/desktop/interface" = {
        enable-hot-corners = false;
      };

      "org/gnome/mutter" = {
        edge-tiling = true;
        dynamic-workspaces = true;
        workspaces-only-on-primary = true;
      };

      "org/gnome/shell/app-switcher/current-workspace-only" = {
        current-workspace-only = true;
      };

      "org/gnome/shell/keybindings" = {
        show-screenshot-ui = [ "<Shift><Alt>o" ];
        screenshot-window = [ "<Shift><Alt>w" ];
      };

      "org/gnome/desktop/wm/keybindings" = {
        move-to-workspace-1 = [ "<Shift><Alt>exclam" ];
        move-to-workspace-2 = [ "<Shift><Alt>at" ];
        move-to-workspace-3 = [ "<Shift><Alt>numbersign" ];
        move-to-workspace-4 = [ "<Shift><Alt>dollar" ];

        witch-to-workspace-1 = [ "<Alt>1" ];
        witch-to-workspace-2 = [ "<Alt>2" ];
        witch-to-workspace-3 = [ "<Alt>3" ];
        witch-to-workspace-4 = [ "<Alt>4" ];

        switch-applications = [ "<Alt>Tab" ];
        switch-windows = [ "<Super>Tab" ];
        toggle-maximized = [ "<Alt>f" ];
        minimize = [ "<Alt>minus" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        next = [ "<Shift><Alt>d" ];
        play = [ "<Shift><Alt>f" ];
        previous = [ "<Shift><Alt>s" ];
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "Vitals@CoreCoding.com"
          "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
          "bluetooth-battery@michalw.github.com"
          "caffeine@patapon.info"
          "clipboard-indicator@tudmotu.com"
          "instantworkspaceswitcher@amalantony.net"
          "notification-banner-reloaded@marcinjakubowski.github.com"
          "ubuntu-appindicators@ubuntu.com"
          "ubuntu-dock@ubuntu.com"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };

      "org/gnome/shell/extensions/auto-move-windows" = {
        application-list = [
          "brave-browser.desktop:1"
          "com.alacritty.Alacritty.desktop:2"
          "slack_slack.desktop:3"
          "spotify_spotify.desktop:4"
        ];
      };

      "org/gnome/shell/extensions/caffeine" = {
        enable-fullscreen = true;
        nightlight-control = "never";
        restore-state = true;
        show-indicator = true;
        user-enabled = true;
      };

      "org/gnome/shell/extensions/clipboard-indicator" = {
        history-size = 100;
        notify-on-copy = false;
        strip-text = true;
      };

      "org/gnome/shell/extensions/notification-banner-reloaded" = {
        anchor-horizontal = 1;
        animation-direction = 1;
        padding-horizontal = 20;
        padding-vertical = 70;
      };

      "org/gnome/shell/extensions/vitals" = {
        hot-sensors = [
          "_memory_usage_"
          "_system_load_1m_"
          "__network-rx_max__"
          "_processor_usage_"
          "_processor_frequency_"
        ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        isolate-monitors = false;
      };
    };
}
