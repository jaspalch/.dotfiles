#!/bin/bash

function usage() {
    cat << EOF
usage: $0 <command>
    setup: Install extensions and update actual settings.json
    sync: Update saved extensions and settings.json files
EOF
    exit 1
}

function setup() {
    installed_exts="$(code --list-extensions)"     
    echo "Installing ./extensions..."
    for ext in $(cat ./extensions); do
        if ! [[ "${installed_exts[*]}" =~ "${ext}" ]]; then
            code --install-extension "${ext}"
        else
            echo "Extension ${ext} is already installed"
        fi
    done

    echo "Updating settings.json..."
    cp "./$SAVJSON" "$JSON"
}

function sync() {
    echo "Saving current settings.json..."
    cp "$JSON" "./$SAVJSON"

    echo "Saving current extensions"
    code --list-extensions > ./extensions 
}

if ! which code &>/dev/null; then
    echo "Can't find vscode 'code' CLI, is vscode installed?" 1>&2
    exit 1
fi

[[ "$#" -ne 1 ]] && usage

OS=$(uname)
JSON="$HOME/.config/Code/User/settings.json"
SAVJSON="./settings_linux.json"

# Mac settings
if [[ "$OS" == 'Darwin' ]]; then
    JSON="$HOME/Library/Application Support/Code/User/settings.json"
    SAVJSON="./settings_mac.json"
fi

case "$1" in
    setup)
        setup;;
    sync)
        sync;;
    *)
        usage;;
esac
