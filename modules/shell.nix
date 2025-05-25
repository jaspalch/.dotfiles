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
      vi = "nvim --clean";
      vim = "nvim";
    };

    sessionVariables = {
      EDITOR = "nvim";
    };

    bashrcExtra =
      builtins.readFile ../dotfiles/bash/start_tmux.sh
      + builtins.readFile ../dotfiles/bash/ps1.sh;
  };

  programs.dircolors = {
    enable = true;
  };

  home.sessionPath = [
    "$HOME/go/bin"
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
