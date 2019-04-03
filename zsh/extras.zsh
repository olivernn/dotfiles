export DESKTOP="dev-dsk-oliven-1a-i-fc271d56.eu-west-1.amazon.com"
alias desktop='ssh -A $DESKTOP'
alias d='mosh $DESKTOP --ssh="ssh -o GSSAPITrustDns=no"'
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

