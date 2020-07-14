#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

OS=$(uname)
HOSTNAME=$(hostname)

export PS1="\[\e[36m\]\u\[\e[m\]\[\e[32;40m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\]\[\e[32m\][\[\e[m\]\[\e[33m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[31m\]=>\[\e[m\] "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Git settings
grep -q 'name = ' ~/.gitconfig &>/dev/null || \
    git config --global user.name "Jaspal Chauhan"
grep -q 'email = ' ~/.gitconfig &>/dev/null || \
    git config --global user.email "jaspalch95@gmail.com"

#OS specific settings
if [[ "$OS" == 'Linux' ]]; then
    :
elif [[ "$OS" == 'Darwin' ]] || [[ "$HOSTNAME" == 'jaspal-desktop' ]]; then
    PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    alias vim="/usr/local/bin/vim"
    sed -i 's/jaspalch95@gmail.com/jchauhan@cloudian.com/' ~/.gitconfig
fi

export EDITOR=vim
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -la'
alias ols="ls -la --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias vi="vim"
