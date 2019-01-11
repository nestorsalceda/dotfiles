source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/path.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/alias.zsh

stty -ixon

bindkey -v

source ~/.config/base16-shell/base16-shell.plugin.zsh
eval "$(dircolors -b)"
eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
