VIRTUAL_ENV_DISABLE_PROMPT=0

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo $(basename $VIRTUAL_ENV)
}
