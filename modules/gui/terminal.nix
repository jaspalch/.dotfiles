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
    source = ../../dotfiles/terminal/wezterm;
  };
  xdg.configFile."alacritty/" = {
    source = ../../dotfiles/terminal/alacritty;
  };
}
