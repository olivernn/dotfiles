autoload -U colors
autoload -U compinit
autoload -U edit-command-line

setopt COMPLETE_IN_WORD
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt NO_BEEP
setopt prompt_subst
setopt autopushd
setopt pushdminus
setopt pushdsilent
setopt pushdtohome

colors
compinit

DIRSTACKSIZE=8
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.history
MAILCHECK=0

EDITOR=vim

source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/edit_command_line.zsh"
source "$HOME/.zsh/tmux.zsh"
source "$HOME/.zsh/git.zsh"
source "$HOME/.zsh/prompt.zsh"
source "$HOME/.zsh/rbenv.zsh"
source "$HOME/.zsh/rsvm.zsh"
source "$HOME/.zsh/golang.zsh"
source "$HOME/.zsh/less.zsh"

# Source any extra config that should not be
# in the public dotfiles repo
if [ -f "$HOME/.zsh/extras.zsh" ]; then
  source "$HOME/.zsh/extras.zsh"
fi

if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
