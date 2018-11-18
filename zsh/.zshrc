# Set up the prompt

if [[ -n ./.zsh/pure/prompt_pure_setup ]]; then
  ln -sf pure.zsh ./.zsh/pure/prompt_pure_setup
  ln -sf async.zsh ./.zsh/pure/async
fi

if [[ -n ./.zsh/spaceship-prompt/prompt_spaceship_setup ]]; then
  ln -sf spaceship.zsh ./.zsh/spaceship-prompt/prompt_spaceship_setup
fi

fpath=("$HOME/.zsh/spaceship-prompt" $fpath)
autoload -Uz promptinit
promptinit
prompt spaceship

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
fpath=(./zsh/zsh-completions/src $fpath)
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

eval "$(direnv hook zsh)"
eval "$(fasd --init auto)"

alias ls='ls --color'

source ~/.config/base16-shell/base16-shell.plugin.zsh
source ./.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ./.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ource ./.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
