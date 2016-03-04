if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Alias definitions import
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Include custom .profile if it exists.
if [ -f "$HOME/.profile" ]; then
   source "$HOME/.profile"
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
