# .bashrc
# Santtu "MFG38" Pesonen

##################
# VARIABLES ETC. #
##################

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoredups:erasedups

if [ -d "~/.local/bin" ]; then
	PATH=$PATH:~/.local/bin
fi

if [ -d "~/.local/share/colette" ]; then
	PATH=$PATH:~/.local/share/colette
fi

export TERM="xterm"
export EDITOR="nvim"
export VISUAL="codium"

bind 'set completion-ignore-case on'

#################
# DEFAULT STUFF #
#################

# Stuff included by default in the EndeavourOS .bashrc.
# All of this probably doesn't need to be here, but I like stuff to work,
# so I'm keeping it just in case. At least for the time being.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

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
alias yayupdate='yay -Syu'
alias upcheck='sudo pacman -Sy && pacman -Qu'
alias doihave='pacman -Q | grep'

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gi='git init'
alias gp='git push'
alias gr='git rm'
alias gs='git status'
alias gu='git pull'

###########
# AUTORUN #
###########

eval "$(starship init bash)"
neofetch
