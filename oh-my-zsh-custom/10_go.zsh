#
# Setup up go related stuff

# add binaries installed via go the path
typeset -U path
path+="$HOME/go/bin"
path+="$HOME/.local/share/cargo/bin"
