#!/usr/bin/env bash

tags="${1}"
[[ -z "${tags}" ]] && tags='all'

if ! command -v ansible-playbook >&/dev/null; then
    echo "Ansible is not installed, exiting..."
    exit 1
fi

ansible-playbook -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --tags "${tags}"
