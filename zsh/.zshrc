source $PWD/.zsh/prompt.zsh
source $PWD/.zsh/history.zsh
source $PWD/.zsh/completion.zsh
source $PWD/.zsh/alias.zsh

stty -ixon

bindkey -v

source ~/.config/base16-shell/base16-shell.plugin.zsh
eval "$(dircolors -b)"
eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"

source $PWD/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PWD/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PWD/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
