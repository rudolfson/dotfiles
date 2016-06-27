source ~/.profile > /dev/null
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/c/Users/lhe/.sdkman"
[[ -s "/c/Users/lhe/.sdkman/bin/sdkman-init.sh" ]] && source "/c/Users/lhe/.sdkman/bin/sdkman-init.sh"
