{...}: {
  xdg.configFile."wezterm/" = {
    source = ../../dots/terminal/wezterm;
  };

  xdg.configFile."alacritty/" = {
    source = ../../dots/terminal/alacritty;
  };
}
