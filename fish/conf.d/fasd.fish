function __fasd_run -e fish_preexec
  command fasd --proc (command fasd --sanitize "$argv" | tr -s ' ' \n) > "/dev/null" 2>&1 &
end
