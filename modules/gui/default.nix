{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./terminal.nix
    ./fonts.nix
  ];
}
