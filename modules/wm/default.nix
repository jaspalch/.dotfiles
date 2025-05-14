{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./waybar.nix
    ./wofi.nix
    ./swaync.nix
    ./swayosd.nix
    ./other.nix
  ];
}
