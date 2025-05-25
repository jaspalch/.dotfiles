_PS1() {
    local bold reset
    bold="$(tput bold)"
    reset="$(tput sgr0)"
    declare -A colors=(["black"]="0" ["red"]="1" ["green"]="2" ["yellow"]="3" ["blue"]="4" ["purple"]="5" ["cyan"]="6" ["white"]="7")

    _BOLD() {
        printf '\001%s\002%s\001%s\002' "${bold}" "${1}" "${reset}" 2>/dev/null
    }
    _COLOR() {
        local color_code
        color_code="$(tput setaf "${colors[$1]}")"
        printf '\001%s\002%s\001%s\002' "${color_code}" "${2}" "${reset}" 2>/dev/null
    }

    local user user_color hostname pwd
    user_color='cyan'
    [[ $USER == 'root' ]] && user_color='red'

    user="$(_BOLD "$(_COLOR $user_color \\u)")"
    hostname="$(_BOLD "$(_COLOR blue \\h)")"
    pwd="$(_BOLD "$(_COLOR yellow [\\w])")"

    PS1="${user}$(_COLOR green '@')${hostname}${pwd}\n $(_BOLD "$(_COLOR $user_color )") "
}

_PS1
