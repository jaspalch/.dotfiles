OS=$(uname)

if [[ "$OS" == 'Darwin' ]]; then
    PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    alias vim="/usr/local/bin/vim"
elif [[ "$OS" == 'Linux' ]]; then
   PATH="$(python -m site --user-base)/bin:$PATH" 
fi
export PATH
