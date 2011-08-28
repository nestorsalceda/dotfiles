#  vim: set ft=zsh ts=4 sw=4 et:

autoload -U add-zsh-hook
autoload -Uz vcs_info

local vcs_system="%{$fg_bold[yellow]%}%s%{$reset_color%}"
local branch="%{$fg_bold[green]%}%b%{$reset_color%}"

zstyle ":vcs_info:*" actionformats \
    "${vcs_system} ${branch} %{$fg_bold[red]%}%a%{$reset_color%} %u%c"
zstyle ":vcs_info:*" formats \
    "${vcs_system} ${branch} %u%c"

zstyle ":vcs_info:*" branchformat "${branch}"
zstyle ":vcs_info:*" unstagedstr "%{$fg_bold[red]%}⚡%{$reset_color%}"
zstyle ":vcs_info:*" stagedstr "%{$fg_bold[blue]%}⚡%{$reset_color%}"

zstyle ":vcs_info:*" check-for-changes true

add-zsh-hook precmd vcs_info

function get_background_jobs {
    echo $(jobs -s | sed -ne '/^\[[0-9]/p' | sed -ne '$=')
}

function format_background_jobs {
    local background_jobs=$(get_background_jobs)
    if [[ -n $background_jobs ]]; then
        echo "%{$fg_bold[green]%}$background_jobs %{$reset_color%}"
    fi
}

local return_code="%(?..%{$fg_bold[red]%}%? %{$reset_color%})"
local background_jobs='$(format_background_jobs)'
local user_host="%{$fg_bold[blue]%}%n@%m%{$reset_color%}"
local current_dir='%{$fg_bold[white]%}%~%{$reset_color%}'

PROMPT="${return_code}${background_jobs}${user_host}:${current_dir}
%{$fg_bold[white]%}»%{$reset_color%} "

RPROMPT='$vcs_info_msg_0_'
