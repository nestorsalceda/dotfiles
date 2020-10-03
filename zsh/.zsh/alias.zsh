if [ $commands[exa] ]; then
  alias ls='exa'
else
  alias ls='ls --color'
fi

alias gst='git status'
alias k='kubectl'
