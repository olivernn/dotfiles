# rbenv
# Only want to do this if rbenv is installed
if type "rbenv" > /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
