{
  config,
  pkgs,
  unstable,
  lib,
  user,
  ...
}: {
  # Specify unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "claude-code"
      "terraform"
    ];

  home.packages = [
    # Compilers/interpreters/runtimes
    pkgs.go
    pkgs.nodejs_24
    pkgs.clang

    # Build tools
    pkgs.gnumake
    pkgs.cargo

    # Doc tools
    pkgs.pandoc

    # IaC tools
    pkgs.ansible
    pkgs.terraform

    # LLM tools
    unstable.claude-code
  ];

  imports = [
    ./tmux
  ];
}
