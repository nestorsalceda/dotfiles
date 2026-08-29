set -U fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

set -gx EDITOR nvim
set -gx VISUAL nvim

fish_config theme choose catppuccin-frappe

if status is-interactive
    starship init fish | source
    direnv hook fish | source
    zoxide init fish | source
    fzf --fish | source
end
