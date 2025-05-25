{
  config,
  pkgs,
  user,
  ...
}: {
  xdg.configFile."nvim/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.homeManagerCfgs}/dots/nvim";
    recursive = false;
  };

  # LSP, formatters, linters
  home.packages = [
    # Language servers
    pkgs.bash-language-server
    pkgs.gopls
    pkgs.lua-language-server
    pkgs.pyright
    pkgs.nil

    # Formatters
    pkgs.nodePackages.prettier
    pkgs.stylua
    pkgs.black
    pkgs.shfmt
    pkgs.gotools
    pkgs.pylint
    pkgs.golangci-lint
    pkgs.alejandra
  ];
}
