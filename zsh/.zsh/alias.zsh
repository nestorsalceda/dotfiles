if [ $commands[exa] ]; then
  alias ls='exa'
else
  alias ls='ls --color'
fi

alias g='git'
alias k='kubectl'
alias be='bundle exec'

if [ $commands[helix] ]; then
  alias hx='helix'
fi