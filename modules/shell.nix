{
  config,
  lib,
  pkgs,
  user,
  ...
}: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -lh";
      la = "ls -la";
      ols = "ls -la --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'";
      vi = "NVIM_MINIMAL=1 nvim";
    };

    sessionVariables = {
      EDITOR = "env NVIM_MINIMAL=1 nvim";
    };

    bashrcExtra =
      builtins.readFile ../dots/bash/start_tmux.sh
      + builtins.readFile ../dots/bash/ps1.sh;

    # For macOS path_helper issue
    initExtra = lib.mkIf pkgs.stdenv.isDarwin ''
      export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"
    '';
  };

  programs.dircolors = {
    enable = true;
  };

  programs.direnv.enable = true;

  home.sessionPath = [
    "$HOME/go/bin"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
