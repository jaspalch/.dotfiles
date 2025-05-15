{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # File manager
    xfce.thunar

    # Screen region selector
    slurp
    # Screenshot tool
    grim

    # Wallpaper daemon
    swww

    # Player controls
    playerctl

    brightnessctl
  ];
}
