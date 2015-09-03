# we ahve 256 colors
export TERM="xterm-256color"

# define aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias tmux='tmux -2'

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

setxkbmap -option caps:escape

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
export GVM_DIR="$HOME/.gvm"
[[ -s "$GVM_DIR/bin/gvm-init.sh" ]] && source "$GVM_DIR/bin/gvm-init.sh"
