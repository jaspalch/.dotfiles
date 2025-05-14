{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      debug = {
        disable_logs = "false";
      };
      # MONITORS
      monitor = ",preferred,auto,auto";

      # MY PROGRAMS
      "$terminal" = "wezterm";
      "$fileManager" = "dolphin";
      "$menu" = ''wofi --show drun --prompt "Run Program"'';

      # AUTOSTART
      ## Autostart necessary processes (like notifications daemons, status bars, etc.)
      ## Or execute your favorite apps at launch like this:
      exec-once = [
        "waybar &"
        "dropbox &"
        "swww-daemon && sleep 0.1"
        "swww img ~/Pictures/wallpapers/current/wallpaper"
        # exec-once = nm-applet &
      ];

      # ENVIRONMENT VARIABLES
      # See https://wiki.hyprland.org/Configuring/Environment-variables/
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"

        ## For QT themes
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "XDG_MENU_PREFIX,arch-"
      ];

      # LOOK AND FEEL
      ## Refer to https://wiki.hyprland.org/Configuring/Variables/
      ## https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        "gaps_in" = "4";
        "gaps_out" = "8";

        "border_size" = "2";

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgba(18a3e0cc)";
        "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        "resize_on_border" = "false";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        "allow_tearing" = "false";

        "layout" = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        "rounding" = "6";

        # Change transparency of focused and unfocused windows
        #"active_opacity" = "0.9";
        #"inactive_opacity" = "1.0";

        shadow = {
          "enabled" = "true";
          "range" = "4";
          "render_power" = "3";
          "color" = "rgba(1a1a1aee)";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          "enabled" = "true";
          "size" = "10";
          "passes" = "1";
          "vibrancy" = "0.1696";
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        "enabled" = "true";

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier, slide"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 5, default, slide"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        "pseudotile" = "true"; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        "preserve_split" = "true"; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        "new_status" = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      # MISC
      misc = {
        "disable_hyprland_logo" = "true";
        "disable_splash_rendering" = "true";
        "force_default_wallpaper" = "-1"; # Set to 0 or 1 to disable the anime mascot wallpapers
      };

      # INPUT
      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        "kb_layout" = "us";
        # Remap Caps Lock to Control
        "kb_options" = "ctrl:nocaps";
        repeat_rate = 40;

        "follow_mouse" = "1";

        "sensitivity" = "-0.13"; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          "natural_scroll" = "true";
          "scroll_factor" = "0.2";
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        "workspace_swipe" = "true";
      };

      # KEYBINDINGS
      ## See https://wiki.hyprland.org/Configuring/Keywords/
      binds = {
        "allow_workspace_cycles" = "true";
      };

      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

      bind = [
        ## Program bindings
        "$mainMod, Return, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, Space, exec, $menu"

        ## Window control bindings
        "$mainMod SHIFT, Q, killactive,"
        #bind = $mainMod, M, exit,
        "$mainMod, M, fullscreen, 1"
        "$mainMod SHIFT, M, fullscreen, 0"

        ## Layout bindings
        "$mainMod, T, togglefloating,"
        "$mainMod SHIFT, T, togglesplit, # dwindle"
        "$mainMod, P, pseudo, # dwindle"

        ## Focus bindings
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"

        # Move to next/prev workspace
        "$mainMod SHIFT, Right, movetoworkspace, e+1"
        "$mainMod SHIFT, Left, movetoworkspace, e-1"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Go through existing workspaces with next/prev
        "$mainMod SHIFT, L, workspace, e+1"
        "$mainMod SHIFT, H, workspace, e-1"

        # Last workspace
        "$mainMod, TAB, workspace, previous"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        ## Function bindings
        ### Audio
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        ", XF86AudioMicMute, exec, swayosd-client --input-volume mute-toggle"

        ### Player controls
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        ### Lock screen
        "$mainMod SHIFT, Escape, exec, pidof hyprlock || hyprlock"

        ## Screenshots
        ### Capture all
        (", print, exec, "
          + pkgs.writeShellScript "full_screenshot.sh"
          ''
            filename=$(date +'%Y-%m-%d_%H:%M:%S.%6N.png')
            ${pkgs.grim}/bin/grim "$HOME/Pictures/Screenshots/$filename" && \
            ${pkgs.libnotify}/bin/notify-send "Screenshot saved" "$filename"
          '')
        ### Capture area
        ("CTRL , print, exec, "
          + pkgs.writeShellScript "area_screenshot.sh" ''
            filename=$(date +'%Y-%m-%d_%H:%M:%S.%6N.png')
            ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" "$HOME/Pictures/Screenshots/$filename" && \
            ${pkgs.libnotify}/bin/notify-send "Screenshot saved" "$filename"
          '')
        ### Capture a specfic screen
        ("CTRL SHIFT, print, exec, "
          + pkgs.writeShellScript "specific_screenshot.sh" ''
            filename=$(date +'%Y-%m-%d_%H:%M:%S.%6N.png')
            ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -o)" "$HOME/Pictures/Screenshots/$filename" && \
            ${pkgs.libnotify}/bin/notify-send "Screenshot saved" "$filename"
          '')
      ];
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      binde = [
        ## Function bindings
        ### Brightness
        ", XF86MonBrightnessUp, exec, swayosd-client --brightness +5"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness -5"

        ### Audio
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume 5 --max-volume 120"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume -5 --max-volume 120"
      ];

      # WINDOWS AND WORKSPACES
      ## See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      ## See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
      windowrulev2 = [
        "opacity 0.85,class:(wezterm)"
        "opacity 0.92,class:(obsidian)"
        "opacity 0.98,class:(brave)"
        "float,class:(flameshot)"
        "suppressevent maximize, class:.*" # You'll probably like this.
      ];

      layerrule = "blur,wofi";

      # unscale XWayland
      xwayland = {
        "force_zero_scaling" = "true";
      };
    };
  };
}
