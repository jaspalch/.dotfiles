{
  config,
  pkgs,
  user,
  ...
}: let
  vim-tmux-navigator =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "vim-tmux-navigator";
      rtpFilePath = "vim-tmux-navigator.tmux";
      version = "unstable-2025-09-24";
      src = pkgs.fetchFromGitHub {
        owner = "christoomey";
        repo = "vim-tmux-navigator";
        rev = "33afa80db65113561dc53fa732b7f5e53d5ecfd0";
        sha256 = "sha256-h3c5ki8N4kiNzbgjxHwLh625un6GqbLZv/4dPVW3vCI=";
      };
    };

  tmux-sensible =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-sensible";
      rtpFilePath = "sensible.tmux";
      version = "unstable-2022-08-14";
      src = pkgs.fetchFromGitHub {
        owner = "tmux-plugins";
        repo = "tmux-sensible";
        rev = "25cb91f42d020f675bb0a2ce3fbd3a5d96119efa";
        sha256 = "sha256-sw9g1Yzmv2fdZFLJSGhx1tatQ+TtjDYNZI5uny0+5Hg=";
      };
    };
  tokyo-night-tmux =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tokyo-night-tmux";
      rtpFilePath = "tokyo-night.tmux";
      version = "1.6.5";
      src = pkgs.fetchFromGitHub {
        owner = "janoamaral";
        repo = "tokyo-night-tmux";
        rev = "caf6cbb4c3a32d716dfedc02bc63ec8cf238f632";
        sha256 = "sha256-TOS9+eOEMInAgosB3D9KhahudW2i1ZEH+IXEc0RCpU0=";
      };
    };
  custom_theme_script = pkgs.writeShellScript "custom_carbonfox.tmux" (builtins.readFile ./themes/custom_carbonfox.tmux);
in {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    keyMode = "vi";
    baseIndex = 1;
    terminal = "tmux-256color";

    extraConfig = ''
      # Window switching
      unbind n
      unbind p
      unbind C-h
      unbind C-l
      unbind Tab
      bind -r C-h previous-window
      bind -r C-l next-window
      bind -r Tab last-window

      # Window splitting (into current directory)
      bind - split-window -v -c "#{pane_current_path}"
      bind _ split-window -h -c "#{pane_current_path}"

      # 24 bit colors
      set-option -a terminal-features "$TERM:RGB"
      set-option -sa terminal-overrides ",xterm*:Tc"

      # Put status bar on top
      set-option -g status-position top

      # Enable mouse
      set -g mouse on

      # Copy mode keybindings
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key P run-shell 'tmux set-buffer -b wl-paste "$(wl-paste --no-newline)"' \; paste-buffer -b wl-paste -d

      # Load theme customizations
      run-shell ${custom_theme_script}
    '';

    sensibleOnTop = false;
    plugins = [
      tmux-sensible
      {
        plugin = vim-tmux-navigator;
        extraConfig = "bind l send-keys 'C-l'";
      }
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_theme moon
        '';
      }
    ];
  };
}
