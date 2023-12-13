# .bashrc
# Santtu "MFG38" Pesonen

#############
# VARIABLES #
#############

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups:erasedups

export TERM="xterm"
export EDITOR="nvim"
export VISUAL="codium"

#################
# DEFAULT STUFF #
#################

# Stuff included by default in the EndeavourOS .bashrc.
# All of this probably doesn't need to be here, but I like stuff to work,
# so I'm keeping it just in case. At least for the time being.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}

###########
# ALIASES #
###########

alias vim='nvim'

alias la='ls -A'
alias ll='ls -Alh'

alias ..='cd ..'
alias ...='cd ../..'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias syncrepos='sudo pacman -Sy'
alias sysupdate='sudo pacman -Syu'
alias upcheck='pacman -Qu'
alias doihave='pacman -Q | grep'

#################
# MORE DEFAULTS #
#################

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

###########
# AUTORUN #
###########

eval "$(starship init bash)"
neofetch
