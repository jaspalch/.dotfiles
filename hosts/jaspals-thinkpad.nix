{config, ...}: {
  config.isWork = true;

  imports = [
    ../modules/development.nix
    ../modules/gui
  ];
}
