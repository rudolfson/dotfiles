#
# Helper functions for the VPN
#

#
# Deactivate all active vpns
#
_vpn_off() {
    active=$(nmcli --get-values uuid,name,type connection show --active | grep ':vpn$')
    for con in $active
    do
        uuid=$(echo $con | cut -d: -f1)
        name=$(echo $con | cut -d: -f2)
        echo "Deactivating $name"
        nmcli c down $uuid
    done
}

#
# Toggle IPv6 on or off
#
_ipv6() {
    toggle=$1
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

vpn() {
  mode="$1"
  case "$mode" in
      "off")
          echo "Deactivating all active VPNs"
          _vpn_off
          _ipv6 on
          ;;
      "rd"|"on")
          echo "Activating VPN 'rd'"
          _vpn_off
          _ipv6 off
          nmcli c up "rd"
          ;;
      "*"|"")
          echo "Invalid option given"
          return 1
          ;;
  esac
}

