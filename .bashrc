# set up colors
[[ -z "$TMUX" ]] && export TERM="xterm-256color"
[[ -e ~/.dircolors ]] && eval "$(dircolors ~/.dircolors)"

# define aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias svndiff='svn diff | sed -r '"'"'s/^(-.*)$/'"'"'$(tput setaf 1)'"'"'\1'"'"'$(tput sgr0)/ | sed -r '"'"'s/^(\+.*)$/'"'"'$(tput setaf 2)'"'"'\1'"'"'$(tput sgr0)/'

# define prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '

# PATH additions
[[ -d $HOME/.rvm/bin ]] && PATH=$PATH:$HOME/.rvm/bin
[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
export PATH

# if vim is present,  use it as an editor
[[ -x /usr/bin/vim ]] && EDITOR=/usr/bin/vim
export EDITOR

# remap caps lock key to escape
[[ -x /usr/bin/setxkbmap ]] && /usr/bin/setxkbmap -option caps:escape

# git stuff
[[ -s "$HOME/.git-prompt.sh" ]] && source "$HOME/.git-prompt.sh"
[[ -s "$HOME/.git-completion.bash" ]] && source "$HOME/.git-completion.bash"

# set language
export LANGUAGE=en


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
