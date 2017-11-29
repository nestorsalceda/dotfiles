function fish_prompt
  if not set -q VIRTUAL_ENV_DISABLE_PROMPT
    set -g VIRTUAL_ENV_DISABLE_PROMPT true
  end
  set_color $fish_color_user
  printf '%s' (whoami)
  set_color normal
  printf ' at '

  set_color $fish_color_host
  echo -n (prompt_hostname)
  set_color normal
  printf ' in '

  set_color $fish_color_cwd
  printf ' %s' (prompt_pwd)
  set_color normal

  # Line 2
  echo
  if test $VIRTUAL_ENV
    printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end
  printf '↪ '
  set_color normal
end
