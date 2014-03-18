#  vim: set ft=zsh ts=4 sw=4 et:

autoload -U add-zsh-hook
autoload -Uz vcs_info

local vcs_system="%{%F{yellow}%}%s%{$reset_color%}"
local branch="%{%F{green}%}%b%{$reset_color%}"

zstyle ":vcs_info:*" actionformats \
    "${vcs_system} ${branch} %{%F{red}%}%a%{$reset_color%} %u%c"
zstyle ":vcs_info:*" formats \
    "${vcs_system} ${branch} %u%c"

zstyle ":vcs_info:*" branchformat "${branch}"
zstyle ":vcs_info:*" unstagedstr "%{%F{red}%}⚡%{$reset_color%}"
zstyle ":vcs_info:*" stagedstr "%{%F{blue}%}⚡%{$reset_color%}"

zstyle ":vcs_info:*" check-for-changes true

add-zsh-hook precmd vcs_info

function get_background_jobs {
    echo $(jobs -s | sed -ne '/^\[[0-9]/p' | sed -ne '$=')
}

function format_background_jobs {
    [ $(get_background_jobs) ] && echo "%{%F{green}%}$(get_background_jobs)%{$reset_color%} "
}

function format_virtualenv_info {
    [ $(virtualenv_info) ] && echo "%{%F{yellow}%}$(virtualenv_info)%{$reset_color%} "
}

function format_rvm_info {
    [ $(rvm_prompt_info) ] && echo "%{%F{red}%}${${$(rvm_prompt_info)/\(/}/\)/}%{$reset_color%} "
}

local return_code="%(?..%{%F{red}%}%? %{$reset_color%})"
local background_jobs='$(format_background_jobs)'
local virtualenv_info='$(format_virtualenv_info)'
local rvm_info='$(format_rvm_info)'
local user_host="%{%F{blue}%}%n@%m%{$reset_color%}"
local current_dir="%{%F{white}%}%~%{$reset_color%}"

PROMPT="${return_code}${background_jobs}${rvm_info}${virtualenv_info}${user_host}:${current_dir}
%{%F{white}%}»%{$reset_color%} "

RPROMPT='$vcs_info_msg_0_'
