#!/bin/bash
# tree, keychain, silversearcher-ag
if [ "$(id -u)" != "0" ]; then
        echo "Sorry, you are not root."
        exit 1
fi

# http://mama.indstate.edu/users/ice/tree/
apt-get install tree
# http://www.funtoo.org/Keychain
apt-get install keychain
# https://github.com/ggreer/the_silver_searcher
apt-get install silversearcher-ag
