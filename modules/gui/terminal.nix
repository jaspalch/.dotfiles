{
  config,
  pkgs,
  ...
}: {
  # Prefer to install terminals through distribution for now
  home.packages = [
    # pkgs.wezterm
  ];

  xdg.configFile."wezterm/" = {
    source = ../../dots/terminal/wezterm;
  };

  xdg.configFile."alacritty/" = {
    source = ../../dots/terminal/alacritty;
  };
}
