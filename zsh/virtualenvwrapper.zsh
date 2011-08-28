WORKON_HOME=~/.virtualenvs
export WORKON_HOME

VIRTUAL_ENV_DISABLE_PROMPT=0

source /etc/bash_completion.d/virtualenvwrapper

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo $(basename $VIRTUAL_ENV)
}
