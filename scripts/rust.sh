#!/usr/bin/env bash

set -Eeuo pipefail

function install_rust() {
    # Install rust using rustup
    # ref. https://www.rust-lang.org/tools/install
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
}

function uninstall_rust() {
    rustup self uninstall
}

