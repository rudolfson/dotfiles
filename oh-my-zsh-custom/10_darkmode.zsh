#
# Dark Mode Switching
# 
# works only with Gnome
#
#

# switch dark mode
switchdm() {
    local current=$(_query_dark_mode)
    local newmode
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
    local current=$(gsettings get org.gnome.desktop.interface color-scheme)
    [[ -z $current ]] && current="prefer-dark"
    echo $current
}

# adjust env variables, terminal colors, etc. according to current mode
_adjust_environment_to_dark_mode() {
    local current=$(_query_dark_mode)
    if [[ "$current" == "'prefer-dark'" ]] {
        export BAT_THEME=gruvbox-dark
        export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=240
        kitty +kitten themes --reload-in=all "Gruvbox Dark"
        if _is_desktop_environment xfce; then
            gsettings set org.gnome.desktop.interface gtk-theme Matcha-dark-azul
        fi
    } else {
        export BAT_THEME=gruvbox-light
        export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=250
        kitty +kitten themes --reload-in=all "Gnome Light"
        if _is_desktop_environment xfce; then
            gsettings set org.gnome.desktop.interface gtk-theme Matcha-light-azul
        fi
    }
}

_is_desktop_environment() (
    local de=${1:-}
    local DEs=${XDG_CURRENT_DESKTOP:-}

    # Shortcut: If de is empty, check if empty DEs
    if [[ -z "$de" ]]; then if [[ "$DEs" ]]; then return; else return 1; fi; fi

    # Lowercase both
    de=${de:l}; DEs=${DEs:l}

    # Check de against each DEs component
    IFS=:; for DE in $DEs; do if [[ "$de" == "$DE" ]]; then return; fi; done

    # Not found
    return 1
)

# trigger adjustments on initial load
_adjust_environment_to_dark_mode

# set a short alias
alias dm=switchdm

