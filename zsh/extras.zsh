export DESKTOP="dev-dsk-oliven-1a-i-fc271d56.eu-west-1.amazon.com"
alias desktop='ssh -A $DESKTOP'
alias d='mosh $DESKTOP --ssh="ssh -o GSSAPITrustDns=no"'
alias mssh="/usr/local/bin/mssh -A"

export LC_ALL="en_GB.UTF-8"
export LANG="en_GB.UTF-8"

# BrazilCLI 2.0 Settings

export PATH="/apollo/env/SDETools/bin:$PATH"

# Postgres

export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
