{
  config,
  pkgs,
  user,
  ...
}: {
  home.packages = [
    pkgs.gcc14
    pkgs.python3Full
    pkgs.go
    pkgs.nodejs_20
    pkgs.cargo

    # Build tools
    pkgs.gnumake
  ];

  imports = [
    ./tmux
  ];
}
