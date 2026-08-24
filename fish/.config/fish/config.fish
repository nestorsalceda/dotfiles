set -U fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

set -gx GOPATH $HOME/.go
fish_add_path $GOPATH/bin $HOME/bin $HOME/.local/bin

set -gx EDITOR nvim
set -gx VISUAL nvim

if type -q eza
    alias ls eza
else
    alias ls 'ls --color'
end

alias g git
alias k kubectl

fish_config theme choose catppuccin-frappe

starship init fish | source
direnv hook fish | source
zoxide init fish | source
