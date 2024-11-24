#!/usr/bin/env bash

set -Eeuo pipefail

function is_homebrew_exists() {
    command -v brew &>/dev/null
}

function install_homebrew() {
    if ! is_homebrew_exists; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

