autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*' stagedstr " ⦿"
zstyle ':vcs_info:git*' unstagedstr " ⦿"
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*' formats "%{$fg[green]%}%c%{$reset_color%}%{$fg[yellow]%}%u%{$reset_color%} %{$fg[white]%}%b%{$reset_color%}"
zstyle ':vcs_info:git*' actionformats "%{$fg[green]%}%c%{$reset_color%}%{$fg[yellow]%}%u%{$reset_color%} %{$fg[white]%}%b%{$reset_color%}"

function +vi-git-untracked() {
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%{$fg[red]%} ⦿%{$reset_color%}"
  fi
}

precmd() {
  vcs_info
}

alias gs='git status'
alias gl='git log --oneline'
alias gb='git branch'
alias gg='git grep -n'
alias gd='git diff'
alias gc='git commit'
alias ga='git add --patch'
alias gdc='git diff --cached'
alias gco='git checkout'
