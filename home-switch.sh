#!/bin/sh
set -e

HOME_MANAGER_CONFIG_DIR=$(dirname $(realpath "$0"))

check_config_path() {
    # default = "${config.home.homeDirectory}/.nix-configs/home-manager";
    home_cfgs_path_from_options="$HOME/$(
        grep -Pzo '(?m)^\s*homeManagerCfgs.*\s*type.*\s*apply.*\s*default.*' $HOME_MANAGER_CONFIG_DIR/options.nix |
            tr '\0' '\n' |
            grep default |
            sed 's~\s*default = "\${config\.home\.homeDirectory}/\(.*\)";~\1~'
    )"

    if [[ "${HOME_MANAGER_CONFIG_DIR}" != "${home_cfgs_path_from_options}" ]]; then
        echo -e "Script is running from different path than what's set in './nix-configs/home-manager/options.nix' ($home_cfgs_path_from_options)\nEnsure the two paths match before continuing!"
        return 1
    fi
}

check_config_path || exit 1

home-manager switch --flake "${HOME_MANAGER_CONFIG_DIR}"
