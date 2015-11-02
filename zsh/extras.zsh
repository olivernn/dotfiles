export DESKTOP="dev-dsk-oliven-1a-i-fc271d56.eu-west-1.amazon.com"
alias desktop='ssh -A $DESKTOP'
alias d='mosh $DESKTOP --ssh="ssh -o GSSAPITrustDns=no"'

export LC_ALL="en_GB.UTF-8"
export LANG="en_GB.UTF-8"
