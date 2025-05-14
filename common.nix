{
  config,
  lib,
  pkgs,
  unstable,
  user,
  ...
}: {
  imports = [
    ./modules/shell.nix
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/debugging.nix
  ];

  home.packages = with pkgs; [
    # General CLI tools
    tree
    file
    ripgrep
    unstable.neovim

    # Compression tools
    unzip
  ];

  programs.fastfetch = {
    enable = true;
  };

  # Used for non-Home Manager configuration
  xdg.configFile."iswork" = lib.mkIf config.isWork {
    text = "work\n";
  };
}
