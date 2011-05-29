# vim: ft=zsh

#===========================================================
# BASIC ENVIRONMENT
#===========================================================

[ ! -r "$HOME/.environment" ] || . "$HOME/.environment"

typeset -U path fpath

path=()
for d in /usr/lib/ccache ~/bin ~/.gem/ruby/1.8/bin /usr/local/bin /usr/bin /bin /usr/bin/X11 /usr/games ; do
    test -d $d || continue
    path=($path $d)
done
export PATH
export LD_LIBRARY_PATH=/usr/local/lib/
export PKG_CONFIG_PATH=/usr/local/

TMPPREFIX=${TMP:-/tmp}/zsh

VISUAL="vim"
EDITOR="vim"
PAGER="less"
export VISUAL EDITOR PAGER

MANWIDTH="80"
LESS="-c -g -i -M -r -S"
#GREP_OPTIONS="--directories=skip"
GREP_OPTIONS="--directories=skip --exclude=*.svn-base"
export MANWIDTH LESS GREP_OPTIONS

export GPG_TTY=`tty`

if type lessfile >/dev/null 2>&1; then
    eval `command lessfile`
fi

if type dircolors >/dev/null 2>&1 && [ -r "$HOME/.dir_colors" ]; then
    eval `command dircolors "$HOME/.dir_colors"`
else
    export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=41;37;01:ex=01;32:*.bak=01;30:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:"
fi

#===========================================================
# OPTIONS!
#===========================================================

umask 022
unlimit coredumpsize

cdpath=(. ~ ..)

setopt ksh_optionprint
setopt printeightbit
setopt extended_glob
setopt correct
setopt nohup

setopt autocd
setopt autopushd
#setopt cdable_vars # forces that lengthy userdir completion
setopt autonamedirs
setopt pushd_ignoredups 

setopt nobgnice nonotify
setopt localoptions localtraps
# setopt shwordsplit
setopt nonomatch


#===========================================================
# HISTORY STUFF
#===========================================================

SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/.zsh_history

#setopt share_history
setopt extended_history
setopt inc_append_history

setopt histverify
setopt hist_ignore_space
setopt hist_reduce_blanks
# setopt hist_allow_clobber
setopt hist_ignore_all_dups

#===========================================================
# FUNKY BINDINGS
#===========================================================

bindkey -v
bindkey    "^u"		backward-kill-line
bindkey    "\eo"	menu-complete
bindkey -s "\ei"	"\eb\eu"
bindkey -s "\e,x"	"xterm &\n"


#===========================================================
# COMPLETION BITS
#===========================================================

autoload -U compinit
compinit -d ~/.zcompdump-$ZSH_VERSION

#set noautomenu
setopt completeinword

if [[ -e ~/.ssh/known_hosts ]]; then
    # Use .ssh/known_hosts for hostnames.
    hosts=(${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*})
    zstyle ':completion:*:hosts' hosts $hosts 
fi 

_cdd() {
    _files -W /usr/share/doc -/
}
compdef _cdd cdd


#===========================================================
# ALIASES MADNESS
#===========================================================

# The funky -s aliases
if [[ $ZSH_VERSION > 4.2 ]]; then
    alias -s html=links
fi

# For pasting
alias %=''
alias $=''

# Damn you
unalias run-help 2>/dev/null

# Self-protecting aliases
alias mv='mv -i'
alias cp='cp -i'

# The 'ls' aliases family
alias ls='ls --color=auto'
alias dir='ls -C --color=yes'
alias l='ls -o'
alias ll='ls -l'
alias lt='ls -tr'
alias lh='ls -oh'
alias lhs='ls -ohSr'
alias lht='ls -ohtr'
alias la='ls -A'
alias lat='ls -Atr'
alias lah='ls -Aoh'
alias lahs='ls -AohSr'
alias laht='ls -Aohtr'
alias cls='env LC_COLLATE=C ls --color=auto'
alias lsd='ls -d *(/)'

# Builtin abbreviating
alias t='true'
alias po='popd'
alias pu='pushd'
alias d='dirs -v'
alias h='history'
alias  j='jobs -l -s' # list stopped jobs
alias jj='jobs -l'    # list all jobs (stopped and running)
alias p='print -l'
alias com='command'

# Always-on options
alias bc='bc -q'
alias df='df -H'
alias cal='cal -m'
alias diff='diff -u'
alias who='who -HuT'
alias adduser='adduser --gecos ""'

# Always-on variables
alias lynx="COLUMNS=80 lynx"

# Noglobs
alias bdo="noglob bdo"
alias find="noglob find"
alias locate="noglob locate"
alias dcut="noglob dcut"

# Some executables not in $PATH
if [ `id -u` -ne 0 ]; then
    alias lsmod='/sbin/lsmod'
    alias exim4='/usr/sbin/exim4'
    alias lsof='/usr/sbin/lsof'
    alias ifconfig='/sbin/ifconfig'
    alias iwconfig='/sbin/iwconfig'
    alias update-alternatives='/usr/sbin/update-alternatives'
fi

# Frequently used commands
#alias s='screen'
#alias c='vlock -a'
alias plainx='startx -- :1'
alias xmonitor-mail='monitor-mail </dev/null >/dev/null 2>&1 &|'
alias martsd='grep "^Arguments" ~/.kde/share/config/kcmartsrc | sed -e "s#^.*=\\\\s#/usr/bin/artswrapper #"'
alias texclean='rm -f *.toc *.lof *.lot *.aux *.log *.out *.bbl *.blg *.cp *.fn *.tp *.vr *.pg *.ky'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias del='rm -f *~ *.bak'

alias du*='du -sh *'
alias du.='du -sh .'
alias dsk='du -sk * | sort -n'

# alias scr='screen -r'
alias sb='. ~/.zshrc'
alias shl='ssh-add -l'
alias shd='ssh-add -D'
alias  pag='r | less'
alias vpag='r | vi -'
alias rpag='r | vi -R -'

alias path='echo -e ${PATH//:/\\n}'
alias fecha='date +"%n%A, %B %-d - %k:%M:%S%n"'
alias res='echo -n -e "\033c\033[10;0]\033[11;0]"'

# apt & co.
alias apti='aptitude'
alias acp='apt-cache policy'
alias acs='apt-cache show'
alias acsr='apt-cache showsrc'

# GnuPG
alias ngpg='gpg --options /dev/null --keyserver pgp.mit.edu --no-default-keyring --keyring'
alias dgpg='gpg --no-options --no-default-keyring --keyring /var/local/keyring/keyrings/debian-keyring.gpg --keyring /var/local/keyring/keyrings/debian-keyring.pgp'

# Vim & Mutt
alias vimq='vim --noplugin'
alias vimr='vim --remote-silent'
alias vimi='vim -u NONE --cmd "set nocp" --cmd "set bg=dark"'

# Gtk Vim
alias gvimr='gvim --remote-tab-silent'

# grep-dctrl
for x in etch sid exp; do
    alias grep-$x="grep-dctrl </var/tmp/g/$x"
    alias grep-s-$x="grep-dctrl </var/tmp/g/s-$x"
done

if [[ $ZSH_VERSION > 4.2 ]]; then
    zmodload -i zsh/datetime
    alias seconds='strftime "%Y-%m-%d %H:%M:%S"'
fi

#===========================================================
# THE PROMPT
#===========================================================

setopt promptsubst

if [[ $ZSH_VERSION > 4.1 ]]; then
    setopt transient_rprompt
fi

autoload -U colors; colors

setup_prompt () {
    color () {
	echo "%{$fg_bold[$1]%}${2}%{$reset_color%}"
    }

    dark_color () {
	echo "%{$fg[$1]%}${2}%{$reset_color%}"
    }

    local -a my_names my_hosts ps1

    my_names=(nestor)
    my_hosts=(tuareg)

    local my_user=$my_names[(r)$USER]
    local my_host=$my_hosts[(r)$HOST]
    local my_whoami

    #if [[ -z $my_host ]]; then
    	my_whoami="$(color blue %m)"
    #else
    #	my_whoami="%m"
    #fi

    #if [[ -z $my_user ]]; then
	my_whoami="$(color blue %n)$(color blue @)$my_whoami"
    #else
    #	my_whoami="%n@$my_whoami"
    #fi

    #if [[ -n $debian_chroot ]]; then
    #	my_whoami="$my_whoami$(color green \($debian_chroot\))"
    #fi

    local my_who="%(#.$(color yellow %#).%#)"
#   local my_tty=$(color magenta %y)
    local my_time="[%D{%H:%M}]"
    local my_marker="%(?..$(color red %?) )"

    # bad one: ۲
    # ١٢٣٤٥٦٧٨٩٠
    ps1=( $(color blue ٢) $(dark_color yellow %8v) " " ${my_marker} ${my_whoami}:%~ $'\n'
	  ${my_who} " ")
    # ps1=($(color red %8v) ${my_who} " ")

    PS1="${(j::)ps1}"
#   RPS1="${my_tty} ${my_time}"
    RPS1="${my_time}"
    
    # chpwd
}

precmd () {
    jobs -s | sed -ne '/^\[[0-9]/p' | sed -ne '$=' | read psvar[8]
    if [[ -n $psvar[8] ]]; then
	psvar[8]="($psvar[8])"
    fi
    # echoti sc
    # echoti cup 0 0
    # # echoti el
    # echoti dl1
    # echoti il1
    # date
    # echoti rc

    # This was formerly in chpwd (), but some apps don't restore the title.
    [[ -t 1 ]] || return

    case $TERM in
	(*xterm*|screen|rxvt|(dt|k|E)term)
	    # print -Pn "\e]2;%y (%~)"
	    print -Pn "\e]0;%y - $HOST${debian_chroot+\($debian_chroot\)}:%~\007"
	    ;;
    esac
}

setup_prompt

#===========================================================
# MY FUNCTIONS
#===========================================================

# Finding files
# ~~~~~~~~~~~~~
function lf ()  { locate -i "*$1*"; }
function ff ()  { find . -iname "*$1*"; }
function ffs () { find . -iname "*$1*"; }
function ffs () { find . -path '*/.svn' -prune -o -iname "*$1*" -print; }
# function fe () { find . -iname "*$1*" -exec $2 "{}" \; ; }
# function fe () { find . -iname "*$1*" -print0 | xargs -r0 $2; }

function filed ()
{
    local path
    for file_arg in "$@"; do
        path=`which "$file_arg"` && file $path
    done
}

# cd to a package's doc dir
# ~~~~~~~~~~~~~~~~~~~~~~~~~
function cdd ()
{
    cd /usr/share/doc/$1
}

# Handy one-liners
# ~~~~~~~~~~~~~~~~
# grep the output of ps
function psgrep () { ps aux | egrep -i ${1:-""} | egrep -v grep; }

# tree(1) with color an ANSI chars, piped to less
function ltree () { tree -CAN "$@" | less; }

# Print command line of a process (via /proc filesystem)
function cmdl ()
{
    local pid
    local xxx=XXX_should_not_occur_in_a_cmdline_XXX

    [ $# -ge 1 ]  ||  return 1
    for pid; do
        [ -d /proc/$pid ] || continue
        cat /proc/$pid/cmdline | xargs -0 -i"$xxx" echo -n "\"$xxx\" "
        # cat /proc/$pid/cmdline | tr '\0' '\\' | sed -e 's/\\/" "/g'
        echo
    done
}


# Edit a file with the execution bit set
function exe ()
{
    if [ $# -ge 1 ]; then
        touch "$@"
        chmod +x "$@"
        $EDITOR "$@"
    else
        echo >&2 "No arguments given."
        return 1
    fi
}


# Swap two filenames around
function swap()
{
    local TMPFILE
    TMPFILE=`mktemp swap.XXXXXX` || return 1
    mv -f "$1" "$TMPFILE"
    mv -f "$2" "$1"
    mv -f "$TMPFILE" "$2"
}

function my-debdiff()
{
    for p in $2/*deb; do
    	P=`basename $p`
	P=`echo $P | cut -d_ -f1`
	debdiff $1/${P}_*deb $p
    done
    echo "# vim: ft=wdiff"
}

function set_java_xawt ()
{
	sudo sed -i 's/XINERAMA/FAKEEXTN/g' /usr/lib/jvm/java-6-sun/jre/lib/i386/xawt/libmawt.so
}
