# Directory navigation aliases
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'

# Grep coloring (Not as important with ag)
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

# Directory listing aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# interrogatives
alias where='pwd'
alias who='who -Hu'
