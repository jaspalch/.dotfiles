{
  config,
  pkgs,
  ...
}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 5;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "${config.home.homeDirectory}/Pictures/wallpapers/current/lockscreen";
          blur_passes = 3;
          blur_size = 8;
          color = "rgba(0, 0, 0, 1)";
        }
      ];

      input-field = [
        {
          size = "250, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "'\'<span foreground='##cad3f5'>Enter password...</span>'\'";
          shadow_passes = 2;
        }
      ];
    };
  };

  services.hypridle = let
    screenDimTimeout = 300;
    lockTimeout = 900;
    screenOffTimeout = 960;
    sleepTimeout = 1800;
  in {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        {
          timeout = screenDimTimeout;
          on-timeout = "brightnessctl -s set 10"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
          on-resume = "brightnessctl -r"; # monitor backlight restore.
        }

        # turn off keyboard backlight, comment out this section if you dont have a keyboard backlight.
        {
          timeout = screenDimTimeout;
          on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0"; # turn off keyboard backlight.
          on-resume = "brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight.
        }

        {
          timeout = lockTimeout;
          on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
        }

        {
          timeout = screenOffTimeout;
          on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
          on-resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
        }

        {
          timeout = sleepTimeout;
          on-timeout = "systemctl suspend"; # suspend pc
        }
      ];
    };
  };
}
