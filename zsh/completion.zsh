# cache the results of completion functions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_completion_cache

# fuzzy matching of completions for when they are mistyped
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# completing process ids with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# remove trailing slash from directories
zstyle ':completion:*' squeeze-slashes true

# never complet the parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd
