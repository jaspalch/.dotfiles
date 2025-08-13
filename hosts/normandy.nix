{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../modules/development.nix
    ../modules/gui/fonts.nix
    ../modules/gui/terminal.nix
  ];
}
