# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias la='ls -lAh'
alias ll='ls -lh'
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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
