#!/usr/bin/env zsh
# This is a sample zsh binding to filter and insert worktrees / branches / the Current
# branch to your terminal, to help streamline the process of switching. It uses fzf but
# can be adapted, as long as the variable added in LBUFFER is the target branch/worktree.
#
# e.g. twt go -b [^b] -> can filter existing branches and create a new worktree.

function _branches {
  branch="$(git branch -q | sed -E "s/[\ \*\+]//" | fzf)"
  LBUFFER="${LBUFFER}$branch"
  local ret=$?
  zle reset-prompt
  return $ret
}

function _worktrees {
  worktree=$(git branch | grep -e "*" -e "+" | cut -d "*" -f 2 | cut -d "+" -f 2 | fzf --header='Current worktree branches:')

  LBUFFER="${LBUFFER}$worktree"
  local ret=$?
  zle reset-prompt
  return $ret
}

function _current_branch {
    branch="$(git branch --show-current)"
    LBUFFER="${LBUFFER}$branch"
    local ret=$?
    zle reset-prompt
    return $ret
}


zle -N _worktrees
zle -N _branches
zle -N _current_branch
bindkey '^h' _worktrees
bindkey '^b' _branches
bindkey '^x' _current_branch
