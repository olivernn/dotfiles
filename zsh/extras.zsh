export DESKTOP="dev-dsk-oliven-1b-a404e8fc.eu-west-1.amazon.com"
alias desktop='ssh -A $DESKTOP'
alias d='mosh $DESKTOP'

export UBUNTU="ub3d091c6ac945a.ant.amazon.com"

alias mssh="/usr/local/bin/mssh -A"

export LC_ALL="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

# Add Toolbox installed binaries to the PATH

export PATH=$HOME/.toolbox/bin:$PATH
export PATH=$PATH:/usr/local/bin  # MIDWAY PATH: Path changed for ssh

alias bb="brazil-build"
alias bt="brazil-build test"
alias bs="brazil-build server"
alias br="brazil-build release"

alias bbr="brazil-recursive-cmd 'brazil-build'"
alias btr="brazil-recursive-cmd 'brazil-build test'"
alias brr="brazil-recursive-cmd 'brazil-build release'"

alias brc="brazil-recursive-cmd"

if (( $+commands[padloper] )); then
  eval "$(padloper setup)"
fi
