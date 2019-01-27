if [[ -n $HOME/.zsh/spaceship-prompt/prompt_spaceship_setup ]]; then
  ln -sf spaceship.zsh $HOME/.zsh/spaceship-prompt/prompt_spaceship_setup
fi

SPACESHIP_PROMPT_ORDER=(
  #vi_mode       # Vi-mode indicator
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  #exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  git           # Git section (git_branch + git_status)
  #venv          # virtualenv section
  #kubecontext   # Kubectl context section
)

SPACESHIP_PROMPT_ADD_NEWLINE=false

SPACESHIP_CHAR_SYMBOL="$ "
SPACESHIP_CHAR_COLOR_SUCCESS=default

SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_DIR_COLOR=blue

fpath=("$HOME/.zsh/spaceship-prompt" $fpath)
autoload -Uz promptinit
promptinit
prompt spaceship
