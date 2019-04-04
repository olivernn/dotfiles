export DESKTOP="dev-dsk-oliven-1b-517af0f2.eu-west-1.amazon.com"
alias desktop='ssh -A $DESKTOP'
alias d='mosh $DESKTOP'
alias mssh="/usr/local/bin/mssh -A"

export LC_ALL="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

# Add Toolbox installed binaries to the PATH

export PATH=$HOME/.toolbox/bin:$PATH

alias bb="brazil-build"
alias bt="brazil-build test"
alias bs="brazil-build server"
alias br="brazil-build release"

alias bbr="brazil-recursive-cmd 'brazil-build'"
alias btr="brazil-recursive-cmd 'brazil-build test'"
alias brr="brazil-recursive-cmd 'brazil-build release'"

