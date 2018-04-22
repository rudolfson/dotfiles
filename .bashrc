# set up colors
#set -x
#trap read debug

[[ -z "$TMUX" ]] && [[ $(uname -o) != "Msys" ]] && export TERM="xterm-256color"
[[ -e ~/.dircolors ]] && eval "$(dircolors ~/.dircolors)"

# define aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias svndiff='svn diff | sed -r '"'"'s/^(-.*)$/'"'"'$(tput setaf 1)'"'"'\1'"'"'$(tput sgr0)/ | sed -r '"'"'s/^(\+.*)$/'"'"'$(tput setaf 2)'"'"'\1'"'"'$(tput sgr0)/'
alias mci='mvn clean install -DskipTests'
which python3 > /dev/null && [[ "$(python --version 2>&1)" != "$(python3 --version 2>&1)" ]] && alias python=python3
which pip3 > /dev/null && [[ "$(pip --version 2>&1)" != "$(pip3 --version 2>&1)" ]] && alias pip=pip3
alias grepsrc='grep --exclude-dir=.git --exclude-dir=target --exclude-dir=.svn --exclude-dir=.meteor --exclude-dir=node_modules'

# define prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '

# PATH additions
[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
[[ -d $HOME/.local/bin ]] && PATH=$PATH:$HOME/.local/bin
export PATH

# if vim is present,  use it as an editor
[[ -x /usr/bin/vim ]] && EDITOR=/usr/bin/vim
export EDITOR

# git stuff
[[ -s "$HOME/.git-prompt.sh" ]] && source "$HOME/.git-prompt.sh"
[[ -s "$HOME/.git-completion.bash" ]] && source "$HOME/.git-completion.bash"

# set language
export LANGUAGE=en

# enable direnv
which direnv > /dev/null && eval "$(direnv hook bash)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
