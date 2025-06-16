# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), containing configuration files for macOS development environment setup. The structure follows chezmoi conventions with the `home/` directory containing templated dotfiles.

## Key Commands

### Karabiner Configuration (TypeScript-based)
- **Build**: `bun run build` (from `home/dot_config/karabiner/`)
- **Watch**: `bun run watch` 
- Generated config outputs to `karabiner.json`

### Lua Formatting
- **Format Lua files**: `stylua .` (uses `.stylua.toml` config)

### Chezmoi Management
- **Apply changes**: `chezmoi apply`
- **Edit files**: `chezmoi edit <file>`
- **Dry run**: `chezmoi diff`

## Architecture

### Karabiner Complex Modifications
The Karabiner configuration is generated from TypeScript files:
- `rules.ts`: Main rule definitions using a custom DSL
- `types.ts`: TypeScript type definitions for Karabiner JSON schema
- `utils.ts`: Helper functions for creating complex modifications
- Uses a "Hyper key" pattern (right_command as modifier combo)

### Tmux/Zellij Session Management
- Custom tmux-sessionizer script in `dot_local/scripts/`
- Both tmux and zellij configurations with similar keybindings
- Session hydration support with `.tmux-sessionizer` files

### Shell Configuration
- Zsh with custom plugins and scripts
- Nushell configuration with modules and completions
- Environment variables managed through chezmoi templates (`.tmpl` files)

### Development Environment
Terminal multiplexers, window managers (yabai/skhd), and editor configurations are tightly integrated for a cohesive development workflow.