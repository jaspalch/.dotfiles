{
  config,
  pkgs,
  ...
}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    fira-code-nerdfont
    jetbrains-mono
  ];
}
