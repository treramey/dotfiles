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
# alias open="explorer.exe"

# grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# nvim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias mo="~/.local/share/nvim-macos/bin/nvim"

# tmux
alias t='tmux'
alias tm='tmux'
alias tx='tmux'
alias fun="tmux attach-session -t node || tmux new-session -s node"
alias sad="tmux attach-session -t pts || tmux new-session -s pts"
alias kill-tmux="tmux kill-session -t"

# directory
alias -g ...='../..'
alias -g ....='../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'

# git
alias main='git checkout main'
alias gco='git checkout'
alias gcob='git checkout -b'

alias gcl='git clone'

alias ga='git add'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'

alias gs='git stash'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gsa='git stash apply'

alias gl="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' HEAD --since='2 months ago' --merges"
alias glo="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all --since='2 months ago' --merges --remotes=origin"

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

# docker
alias dk='docker'
alias dkp='docker ps'
alias dki='docker images'
alias dkc='docker container'

# npm

# pyenv
alias py='pyenv'
alias pyv='pyenv version'
alias pyvs='pyenv versions'

alias pyi='pyenv install'
alias pyu='pyenv uninstall'

alias pyl='pyenv local'
alias pyg='pyenv global'

alias pyw='pyenv which'

