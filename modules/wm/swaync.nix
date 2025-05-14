{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.libnotify
  ];

  services.swaync = {
    enable = true;
  };
}
