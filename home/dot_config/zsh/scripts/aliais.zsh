#!/usr/bin/env zsh

# custom
alias ws="cd $WORKSPACE"

# ls
alias ls='ls --color=auto'
alias l='ls -lAFh'
alias la='ls -lAFh'
alias lr='ls -tRFh'
alias lt='ls -ltFh'
alias ll='ls -l'

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# nvim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# rider
function rider() {
    # Use provided directory or current directory if none provided
    local dir="${1:-.}"
    
    # Find the single Rider application
    local rider_app=$(find /Applications -maxdepth 1 -name "Rider*.app" | head -n 1)
    if [ -z "$rider_app" ]; then
        echo "No Rider installation found."
        return 1
    fi

    # Find the single .sln file in the specified directory
    local sln_file=$(find "$dir" -name "*.sln" | head -n 1)
    if [ -z "$sln_file" ]; then
        echo "No .sln file found in the specified directory or its subdirectories."
        return 1
    fi

    # Open the .sln file with Rider
    open -na "$rider_app" --args "$sln_file"
}

alias zj=zellij
alias lg=lazygit
alias cw=clone-worktrees
alias claude="$HOME/.claude/local/claude"
