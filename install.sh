#!/bin/bash
# Script to "install" the profile configuration

mv ~/.bash_profile backup/
mv ~/.bashrc backup/
mv ~/.bash_aliases backup/
cp .bash_profile ~
cp .bashrc ~
cp .bash_aliases ~
cp .screenrc ~
