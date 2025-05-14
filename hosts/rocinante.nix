{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../modules/development.nix
    ../modules/gui
    ../modules/wm
  ];
}
