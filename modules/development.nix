{
  config,
  pkgs,
  user,
  ...
}: {
  home.packages = [
    pkgs.go
    pkgs.nodejs_20

    # Build tools
    pkgs.gnumake
    pkgs.cargo
  ];

  imports = [
    ./tmux
  ];
}
