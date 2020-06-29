#
# ~/.bashrc
#

OS=$(uname)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

#OS specific settings
if [[ "$OS" == 'Linux' ]]; then
    :
elif [[ "$OS" == 'Darwin' ]]; then
    PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    alias vim="/usr/local/bin/vim"
fi

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -la'
alias ols="ls -la --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias vi="vim"
