set fish_greeting
set fish_key_bindings fish_vi_key_bindings

set -x EDITOR "vim"
set -x VISUAL "vim"
set -x GOPATH ~/Projects/golang
set -U fish_user_paths $GOPATH/bin ~/.local/bin $fish_user_paths
