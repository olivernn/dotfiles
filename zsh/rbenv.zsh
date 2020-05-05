# rbenv
# Only want to do this if rbenv is installed
if type "rbenv" > /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# from the ruby-build post install message
if type "brew" > /dev/null; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
fi
