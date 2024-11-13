#
# Dark Mode Switching
# 
# works only with Gnome
#

# switch dark mode
switchdm() {
    current=$(_query_dark_mode)
    if [[ "$current" == "'prefer-dark'" ]] {
        newmode="default"
    } else {
        newmode="prefer-dark"
    }
    gsettings set org.gnome.desktop.interface color-scheme "$newmode"
    _adjust_environment_to_dark_mode
}

# query current mode
_query_dark_mode() {
    gsettings get org.gnome.desktop.interface color-scheme
}

# adjust env variables, terminal colors, etc. according to current mode
_adjust_environment_to_dark_mode() {
    current=$(_query_dark_mode)
    if [[ "$current" == "'prefer-dark'" ]] {
        export BAT_THEME=gruvbox-dark
        kitty +kitten themes --cache-age=-1 --reload-in=all "Gruvbox Dark"
    } else {
        export BAT_THEME=gruvbox-light
        kitty +kitten themes --cache-age=-1 --reload-in=all "Solarized Light"
    }
}

# trigger adjustments on initial load
_adjust_environment_to_dark_mode

# set a short alias
alias dm=switchdm


