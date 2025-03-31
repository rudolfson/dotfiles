#
# Helper functions for the network
#

# #
# Toggle IPv6 on or off
#
ipv6() {
    local toggle=$1
    case $toggle in
        "on"|"1")
            echo "Activating IPv6"
            sudo sysctl net.ipv6.conf.all.disable_ipv6=0
            ;;
        "off"|"0")
            echo "Deactivating IPv6"
            sudo sysctl net.ipv6.conf.all.disable_ipv6=1
            ;;
    esac
}

