#!/bin/bash

_GIT() {
    which git &>/dev/null || return
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local _git_branch
    _git_branch="$(git branch --show-current)"

    local _git_diff
    git diff --quiet || _git_diff=" "

    local _git_info
    [[ ! -z "${_git_branch}" ]] && _git_info="${_git_branch}"
    [[ ! -z "${_git_diff}" ]] && _git_info="${_git_info} ${_git_diff}"
    [[ ! -z "${_git_info}" ]] && echo -n "  [${_git_info}] "
}

export -f _GIT

_PS1() {
    local _reset="$(tput sgr0)"

    _BOLD() {
        local bold="$(tput bold)"
        echo -n "\001${bold}\002${1}\001${_reset}\002" 2>/dev/null  
    }
    _COLOR() {
        declare -A colors=(["black"]="0" ["red"]="1" ["green"]="2" ["yellow"]="3" ["blue"]="4" ["purple"]="5" ["cyan"]="6" ["white"]="7")
        local code="$(tput setaf ${colors[$1]})"
        echo -n "\001${code}\002${2}\001${_reset}\002" 2>/dev/null
    }

    local _user="$(_BOLD $(_COLOR purple $USER ))"
    local _hostname="$(_BOLD $(_COLOR blue \\h ))"
    local _pwd="$(_BOLD $(_COLOR cyan [\\w] ))"
    local _git="$(_BOLD $(_COLOR green '$(_GIT)'))"

    PS1="${_user}$(_COLOR green '@')${_hostname}${_pwd}${_git}$(_BOLD $(_COLOR yellow \$)) "
}

_PS1
