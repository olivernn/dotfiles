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
source "$HOME/.zsh/tmux.zsh"
source "$HOME/.zsh/git.zsh"
source "$HOME/.zsh/prompt.zsh"
source "$HOME/.zsh/rbenv.zsh"
source "$HOME/.zsh/rsvm.zsh"
source "$HOME/.zsh/less.zsh"
