{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."brave-flags.conf" = {
    source = ../dots/misc/brave-flags.conf;
  };
}
