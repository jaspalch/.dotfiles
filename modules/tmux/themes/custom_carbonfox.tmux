#!/usr/bin/env bash

declare -A CUSTOM_THEME=(
    ["background"]="#161616"
    ["foreground"]="#f2f4f8"
    ["black"]="#282828"
    ["blue"]="#78a9ff"
    ["cyan"]="#33b1ff"
    ["green"]="#25be6a"
    ["magenta"]="#be95ff"
    ["red"]="#ee5396"
    ["white"]="#dfdfe0"
    ["yellow"]="#08bdba"

    ["bblack"]="#484848"
    ["bblue"]="#8cb6ff"
    ["bcyan"]="#52bdff"
    ["bgreen"]="#46c880"
    ["bmagenta"]="#c8a5ff"
    ["bred"]="#f16da6"
    ["bwhite"]="#e4e4e5"
    ["byellow"]="#2dc7c4"
)

RESET="#[fg=${CUSTOM_THEME[foreground]},bg=${CUSTOM_THEME[background]},nobold,noitalics,nounderscore,nodim]"
# Highlight colors
tmux set -g mode-style "fg=${CUSTOM_THEME[bgreen]},bg=${CUSTOM_THEME[bblack]}"

tmux set -g message-style "bg=${CUSTOM_THEME[blue]},fg=${CUSTOM_THEME[background]}"
tmux set -g message-command-style "fg=${CUSTOM_THEME[white]},bg=${CUSTOM_THEME[black]}"

tmux set -g pane-border-style "fg=${CUSTOM_THEME[bblack]}"
tmux set -g pane-active-border-style "fg=${CUSTOM_THEME[blue]}"

tmux set -g status-style bg="${CUSTOM_THEME[background]}"

#+--- Bars LEFT ---+
# Session name
tmux set -g status-left "#[fg=${CUSTOM_THEME[bblack]},bg=${CUSTOM_THEME[blue]},bold] #{?client_prefix,󰠠 ,#[dim]󰤂 }#[bold,nodim]#S$hostname "

#+--- Windows ---+
# Focus
tmux set -g window-status-current-format "$RESET#[fg=${CUSTOM_THEME[green]},bg=${CUSTOM_THEME[bblack]}] #{?#{==:#{pane_current_command},ssh},󰣀 ,$active_terminal_icon $window_space}#[fg=${CUSTOM_THEME[foreground]},bold,nodim]$window_number#W#[nobold]#{?window_zoomed_flag, $zoom_number, $custom_pane}#{?window_last_flag, , }"
# Unfocused
tmux set -g window-status-format "$RESET#[fg=${CUSTOM_THEME[foreground]}] #{?#{==:#{pane_current_command},ssh},󰣀 ,$terminal_icon $window_space}${RESET}$window_number#W#[nobold,dim]#{?window_zoomed_flag, $zoom_number, $custom_pane}#[fg=${CUSTOM_THEME[yellow]}]#{?window_last_flag,󰁯  , }"
