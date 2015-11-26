# set up colors
[[ -z "$TMUX" ]] && export TERM="xterm-256color"
[[ -e ~/.dircolors ]] && eval "$(dircolors ~/.dircolors)"

# define aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias ff='firefox -new-instance -P default > /dev/null 2>&1 &'
alias ffwg='firefox -new-instance -P wg > /dev/null 2>&1 &'

# define prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# PATH additions
[[ -d $HOME/.rvm/bin ]] && PATH=$PATH:$HOME/.rvm/bin
[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
export PATH

# remap caps lock key to escape
setxkbmap -option caps:escape

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
