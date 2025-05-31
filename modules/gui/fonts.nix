{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
