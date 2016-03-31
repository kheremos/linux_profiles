# ~/.bashrc: executed by bash(1) for non-login shells.
# .bash_profile sources this file
# Utility methods are currently stored here, but may be
#  included elsewhere in the future

# Add command to ascertain external ip
whatsmyip() {
  if hash dig 2>/dev/null; then
    echo "Sending dig request to @resolver1.opendns.com."
    dig +short myip.opendns.com @resolver1.opendns.com
  else
    echo "command 'dig' required."
  fi
}


# Disable ctrl-s locking
[[ $- == *i* ]] && stty -ixon

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Run keychain if available
 if hash keychain 2>/dev/null; then
     eval `keychain --eval --agents ssh id_rsa`
 else
     echo "ssh keychain not available"
 fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt 
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

############## set_screen_title ##############
# Sets screen and Terminal title.  May not work
# for all terminals.
set_screen_title ()
{
    echo -ne "\ek$1\e\\"
    echo -e '\033]2;'$1'\007'
}

############## GBRAIN HELP SYSTEM ##############
# Autocomplete method for the 'ghelp' function
_ghelp()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    # these map to files in the /notes/ directory
    COMPREPLY=( $(compgen -W "vim git screen" -- $cur) )
}
complete -F _ghelp ghelp

ghelp(){
	cat ${GHELP_DIR}/notes/$1_notes.md
}

#       AWS Host Config
####################################################
gsHOST='\h'
if hash jq 2>/dev/null; then
  gsHOST=`jq -r '.Name' /opt/gs/etc/instance-tags.json`
fi
if [ "null" == "$HOST" ]; then
  gsHOST='\h'
fi

#       CONFIGURATE FUNCTION
#       Customization script involving much COLOR (Command line & ls)
#####################################################################
function configurate
{
local DGRAY="\[\033[1;30m\]"    DGR="1;30"
local RED="\[\033[0;31m\]"      RD="0;31"
local BRED="\[\033[1;31m\]"     BRD="1;31"
local GRAY="\[\033[0;37m\]"     GR="0;37"
local WHITE="\[\033[1;37m\]"    WH="1;37"
local GREEN="\[\033[0;32m\]"    GR="0;32"
local BGREEN="\[\033[1;32m\]"   BGR="1;32"
local CYAN="\[\033[0;36m\]"     CY="00;36"
local BCYAN="\[\033[1;36m\]"    BCY="1;36"
local BLUE="\[\033[0;34m\]"     BL="0;34"
local BBLUE="\[\033[1;34m\]"    BBL="1;34"
local PURPL="\[\033[0;35m\]"    PRP="0;35"
local BPURP="\[\033[1;35m\]"    BPRP="1;35"
local YELLOW="\[\033[0;33m\]"   YL="0;33"
local BYLLOW="\[\033[1;33m\]"   BYL="1;33"
local NORMC="\[\033[40m\]${GRAY}"
export PS1="
${GREEN}\u${GRAY}@${CYAN}\h${BBLUE}:\w
${NORMC}\$ "
### set -vfx    ### Debug listing
local STRUCT_1="no=00:fi=00:pi=40;33:so=01;35:di=$BBL:ln=$BCY:ex=$BGR"
local STRUCT_2="bd=40;33;01:cd=40;33;01:or=40;31;01"
local ZIPS_1="*.tar=$BRD:*.tgz=$BRD:*.arj=$BRD"
local ZIPS_2="*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31"
local PICS_1="*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.png=01;35"
local PICS_2="*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=$BYL:*.xpm=01;35:*.tif=01;35"
local MOVS_1="*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35"
local EXTRA_C="*.txt=01;36:*.gag=$RD:*.x=$GR:*.rb=$YL"
export LS_COLORS="$STRUCT_1:$STRUCT_2:$ZIPS_1:$ZIPS_2:$PICS_1:$PICS_2:$MOVS_1:${EXTRA_C}"
}
configurate
