{
  config,
  pkgs,
  lib,
  unstable,
  user,
  ...
}: {
  programs.aerospace = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
    package = unstable.aerospace;
  };
}
