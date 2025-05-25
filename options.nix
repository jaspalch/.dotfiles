{
  config,
  pkgs,
  ...
}: {
  isWork = pkgs.lib.mkOption {
    type = pkgs.lib.types.bool;
    default = false;
    example = false;
    description = "Option to enable work customizations";
  };

  homeManagerCfgs = pkgs.lib.mkOption {
    type = pkgs.lib.types.path;
    apply = toString;
    default = "${config.home.homeDirectory}/.dotfiles";
    example = "${config.home.homeDirectory}/.dotfiles";
    description = "Absolute path to home-manager configs (wherever they're cloned)";
  };
}
