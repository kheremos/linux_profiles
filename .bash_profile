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
