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

  services.home-manager.autoExpire = {
    enable = true;
    frequency = "weekly";
    timestamp = "-21 days";
    store = {
      cleanup = true;
    };
  };

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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
