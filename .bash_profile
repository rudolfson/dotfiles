source ~/.profile > /dev/null
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/lars/.sdkman"
[[ -s "/home/lars/.sdkman/bin/sdkman-init.sh" ]] && source "/home/lars/.sdkman/bin/sdkman-init.sh"
