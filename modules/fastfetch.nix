{
  config,
  pkgs,
  user,
  ...
}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = ../dots/fastfetch/logo.txt;
        type = "file";
      };
      modules = [
        "break"
        "title"
        "separator"
        "os"
        "kernel"
        "host"
        "cpu"
        "gpu"
        "shell"
        "packages"
        "de"
        "wm"
        "theme"
        "terminal"
        "terminalfont"
        "break"
        "colors"
      ];
    };
  };
}
