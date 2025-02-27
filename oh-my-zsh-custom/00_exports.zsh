#
# Basic exports necessary to configure the system
#

export EDITOR="nvim"
export PAGER="less -FIRX"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"


#
# Fixes according to jxdg-ninja
#
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export DOT_SAGE="$XDG_CONFIG_HOME/sage"

