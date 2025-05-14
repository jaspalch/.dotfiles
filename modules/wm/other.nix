{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # File manager
    kdePackages.dolphin

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
