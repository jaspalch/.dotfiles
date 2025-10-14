{
  config,
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
      EDITOR = "NVIM_MINIMAL=1 nvim";
    };

    bashrcExtra =
      builtins.readFile ../dots/bash/start_tmux.sh
      + builtins.readFile ../dots/bash/ps1.sh;
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
