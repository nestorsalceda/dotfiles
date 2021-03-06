source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/path.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/alias.zsh

stty -ixon

bindkey -v
export EDITOR=nvim
export VISUAL=nvim

[ -f "$HOME/.dir_colors" ] && eval $(dircolors $HOME/.dir_colors)
eval "$(direnv hook zsh)"
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh


bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
