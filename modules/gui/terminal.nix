{pkgs, ...}: {
  home.packages = with pkgs; [
    alacritty-theme
  ];

  programs.alacritty = {
    enable = true;
    theme = "tokyo_night";

    settings = {
      window = {
        decorations = "None";
        opacity = 0.75;
        blur = true;
      };

      font = {
        size = 16;
        normal = {
          family = "JetBrainsMonoNL Nerd Font";
          style = "Light";
        };
      };
    };
  };
}
