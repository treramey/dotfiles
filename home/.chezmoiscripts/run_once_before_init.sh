#!/bin/sh

[[ -d "$HOME/workspace/work" ]] || mkdir -p "$HOME/workspace/work"
[[ -d "$HOME/workspace/personal" ]] || mkdir -p "$HOME/workspace/personal"

# zsh cache dir
[[ -d "$HOME/.cache/zsh" ]] || mkdir -p "$HOME/.cache/zsh"
