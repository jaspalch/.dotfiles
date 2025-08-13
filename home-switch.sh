#!/bin/bash
set -e

HOME_MANAGER_CONFIG_DIR=$(dirname $(realpath "$0"))

check_config_path() {
    # default = "${config.home.homeDirectory}/.dotfiles";
    home_cfgs_path_from_options="$HOME/$(
        awk '
        /homeManagerCfgs *=/ { inBlock = 1 }
        /^[[:space:]]*}/ && inBlock { inBlock = 0 }
        /default *=/ && inBlock {
          # Extract the full line and clean it up manually
          gsub(/^.*default *= *"\$\{config\.home\.homeDirectory\}\/?/, "", $0)
          gsub(/[";].*$/, "", $0)
          print $0
          exit
        }
        ' $HOME_MANAGER_CONFIG_DIR/options.nix
    )"

    if [[ "${HOME_MANAGER_CONFIG_DIR}" != "${home_cfgs_path_from_options}" ]]; then
        echo -e "Script is running from different path than what's set in './nix-configs/home-manager/options.nix' ($home_cfgs_path_from_options)\nEnsure the two paths match before continuing!"
        return 1
    fi
}

check_config_path || exit 1

home-manager switch --flake "${HOME_MANAGER_CONFIG_DIR}"
