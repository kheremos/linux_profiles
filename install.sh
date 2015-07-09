#!/bin/bash
# Script to "install" the profile configuration

function moveIt {
 if [ -e "$HOME/$1" ]
 then
   echo "Moving previous $1 into backup directory."
   mv "$HOME/$1" "backup/" --backup=t
 # else
   # echo "$HOME/$1 not found."
 fi
 cp $1 $HOME
}

moveIt .bash_profile
moveIt .bash_aliases
moveIt .bashrc
moveIt .screenrc
