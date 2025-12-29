#
# Rust related stuff
#
export CARGO_HOME="$XDG_DATA_HOME/cargo"
[[ -f "$CARGO_HOME/env" ]] && source "$CARGO_HOME/env"

# add installed rust programs to path
typeset -U path
path+="$HOME/.local/share/cargo/bin"
