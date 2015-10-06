alias ll='ls -lGpFh'
alias la='ll -a'

alias tree='tree -C'

alias dh='dirs -v'

alias YYYY-MM-DD='date -u +"%Y-%m-%d"'
alias YYYY-MM-DD-HH='date -u +"%Y-%m-%d-%H"'

alias lines2spaces="awk -vORS=' ' '{ print $1 }'"

alias stripcolors='sed "s/\x1B\[\([0-9]\{1,2\}\(;[0-9]\{1,2\}\)\?\)\?[mGK]//g"'
