#!/bin/zsh
# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.gem/ruby/3.0.1/bin:$PATH"
# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
