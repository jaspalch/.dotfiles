{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."brave-flags.conf" = {
    source = ../../dotfiles/misc/brave-flags.conf;
  };
}
