# set up colors
#set -x
#trap read debug

[[ -z "$TMUX" ]] && [[ $(uname -o) != "Msys" ]] && export TERM="xterm-256color"
[[ -e ~/.dircolors ]] && eval "$(dircolors ~/.dircolors)"

# define aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias grepsrc='grep --exclude-dir=.git --exclude-dir=target --exclude-dir=.svn --exclude-dir=.meteor --exclude-dir=node_modules'
alias jwtd="jq -R 'split(\".\") | .[0],.[1] | @base64d | fromjson'"
alias c='xclip -selection clipboard'
alias v='xclip -o -selection clipboard'

# some functions (aliases with parameters)
gclean() {
    branch="$1"
    [[ -z $branch ]] && branch="main"
    [[ $branch == "d" ]] && branch="develop"
    git switch "$branch" || return $?
    git fetch --all -p
    git merge || return $?
    git branch -v | grep '\[gone\]' | awk '{print $1}' | xargs -r git branch -D
}

# define prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '

# PATH additions
for p in "$HOME/bin" "$HOME/go/bin"; do
    [[ -d $p ]] && PATH=$PATH:$p
done
export PATH

# if vim is present,  use it as an editor
[[ -x /usr/bin/vim ]] && EDITOR=/usr/bin/vim
export EDITOR

# git stuff
[[ -s "$HOME/.git-prompt.sh" ]] && source "$HOME/.git-prompt.sh"

# set language
export LANGUAGE=en

# load a system specific bashrc
[[ -s "$HOME/.local/.bashrc" ]] && source "$HOME/.local/.bashrc"

# enable direnv
which direnv > /dev/null 2>&1 && eval "$(direnv hook bash)"

# cd into home directory if we are somewhere in /mnt/c/Users
[[ $(pwd) =~ /mnt/c/Users/[a-z]+$ ]] && cd ~

# gcloud SDK
export GCLOUD_DIR="$HOME/Tools/google-cloud-sdk"
[[ -s "$GCLOUD_DIR/path.bash.inc" ]] && source "$GCLOUD_DIR/path.bash.inc"
[[ -s "$GCLOUD_DIR/completion.bash.inc" ]] && source "$GCLOUD_DIR/completion.bash.inc"

# node version manager
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# command completions
[[ -x ~/bin/oc ]] && eval "$(oc completion bash)"
[[ -x /usr/bin/terraform ]] && complete -C /usr/bin/terraform terraform
[[ -f /usr/share/bash-completion/completions/git ]] && source /usr/share/bash-completion/completions/git
if which kubectl 2> /dev/null; then . <(kubectl completion bash > /dev/null 2>&1); fi
[[ -x /usr/bin/gh ]] && eval "$(/usr/bin/gh completion -s bash)"
if which flux 2> /dev/null; then . <(flux completion bash); fi
