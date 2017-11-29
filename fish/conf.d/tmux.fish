if status is-interactive; and not set -q TMUX
  tmux start-server

  if not tmux has-session 2> /dev/null
    set -l tmux_session "workspace"
    tmux new-session -d -s $tmux_session
    tmux set-option -t $tmux_session destroy-unattached off
  end

  exec tmux attach-session
end
