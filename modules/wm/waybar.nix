{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    style = ../../dots/waybar/style.css;
    settings = {
      mainBar = {
        "height" = 28; # Waybar height (to be removed for auto height)
        # "width" = 1280; # Waybar width
        "spacing" = 8; # Gaps between modules (4px)
        "margin-top" = 6;
        "margin-left" = 6;
        "margin-right" = 6;

        # Modules
        "modules-left" = [
          "hyprland/workspaces"
        ];
        "modules-center" = [
          "hyprland/window"
        ];
        "modules-right" = [
          "tray"
          "pulseaudio"
          "network"
          "backlight"
          "idle_inhibitor"
          "battery"
          "clock"
          "custom/power"
        ];
        "hyprland/window" = {
          "max-length" = 25;
        };
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "1" = " ";
            "2" = " ";
            "3" = " ";
            "4" = " ";
            "5" = " ";
            "6" = " ";
            "7" = "";
            "default" = " ";
          };
          "persistent-workspaces" = {
            "*" = 7; # 7 workspaces by default on every monitor
          };
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = " ";
            "deactivated" = " ";
          };
        };
        "tray" = {
          # "icon-size" = 21;
          "spacing" = 10;
        };
        "clock" = {
          # "timezone" = "America/New_York";
          "format" = "{:%I:%M %p}";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%a %Y-%m-%d}";
        };
        "backlight" = {
          # "device" = "acpi_video1";
          "format" = "{icon} {percent}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
        };
        "battery" = {
          "states" = {
            # "good" = 95;
            "warning" = 20;
            "critical" = 10;
          };
          "format" = "{icon} {capacity}%";
          "format-full" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{icon} {time}";
          # "format-full" = "";
          "format-icons" = [" " " " " " " " " "];
        };
        "network" = {
          # "interface" = "wlp2*"; # (Optional) To force the use of this interface
          "format-wifi" = "  {essid}";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          # "scroll-step" = 1; # %, can be a float
          "format" = "{icon} {volume}% {format_source}";
          "format-bluetooth" = "{icon} {volume}% {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = " {volume}%";
          "format-source-muted" = " ";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" " "];
          };
          "on-click" = "pavucontrol";
        };
        "custom/power" = {
          "format" = "⏻";
          "tooltip" = false;
          "menu" = "on-click";
          "menu-file" = "$HOME/.config/waybar/power_menu.xml"; # Menu file in resources folder
          "menu-actions" = {
            "shutdown" = "shutdown";
            "reboot" = "reboot";
            "suspend" = "systemctl suspend";
            "hibernate" = "systemctl hibernate";
          };
        };
      };
    };
  };
}
