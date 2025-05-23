#
# Utilities to work with JWTs
#

jwtd() {
    if [[ -x $(command -v jq) ]]; then
        jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "${1}"
        echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
    fi
}

kclm() {
    if [[ -x $(command -v jq) ]]; then
        jq -r .message <<< "${1}" | jq
    fi
}
