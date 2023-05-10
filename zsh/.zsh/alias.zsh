if [ $commands[exa] ]; then
  alias ls='exa'
else
  alias ls='ls --color'
fi

alias g='git'
alias k='kubectl'

if [ $commands[helix] ]; then
  alias hx='helix'
fi