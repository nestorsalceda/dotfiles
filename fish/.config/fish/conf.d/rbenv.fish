# workaround until next rbenv debian update
function setenv
  set -gx $argv
end

status --is-interactive; and . (rbenv init -|psub)
