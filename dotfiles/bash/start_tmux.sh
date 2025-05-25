DEFAULT_TMUX_SESSION='0'
IFS=$'\n' read -r -d '' -a ATTACHED_SESSIONS < <(tmux list-sessions -F '#{session_name}' -f '#{session_attached}' && printf '\0')
IFS=$'\n' read -r -d '' -a DETACHED_SESSIONS < <(tmux list-sessions -F '#{session_name}' -f '#{?session_attached,0,1}' && printf '\0')

# If in the right spot to run tmux
if command -v tmux &>/dev/null && [[ -n "${PS1}" ]] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ -z "$INSIDE_EMACS" ]; then
    # Check if default session exists
    if tmux has-session -t "$DEFAULT_TMUX_SESSION"; then
        if [[ " ${ATTACHED_SESSIONS[*]} " =~ " $DEFAULT_TMUX_SESSION " ]]; then
            # Default session is already attached
            first_detached_session="${DETACHED_SESSIONS[0]}"
            if [[ "${first_detached_session}" == "" ]]; then
                # Create new session if no available detached sessions exist
                tmux new-session
            else
                # Attach to first available detached session
                tmux attach-session -t "${first_detached_session}"
            fi
        else
            # Attach to detached default session
            tmux attach-session -t "$DEFAULT_TMUX_SESSION"
        fi
    else
        # Create default session if it doesn't exist
        tmux new-session -s "$DEFAULT_TMUX_SESSION"
    fi
fi
