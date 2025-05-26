#
# Utilities to work with JWTs
#

jwtd() {
    if [[ -x $(command -v jq) ]]; then
        local header=$(jq -R 'split(".") | .[0] | @base64d | fromjson' <<< "${1}")
        local payload=$(jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "${1}")
        jq <<< "${header}"
        jq <<< "${payload}"
        local iat=$(jq .iat <<< "${payload}")
        local exp=$(jq .exp <<< "${payload}")
        [[ -n $iat ]] && echo "Issued:  $(jq -r '.iat | todate' <<< ${payload})"
        [[ -n $exp ]] && echo "Expires: $(jq -r '.exp | todate' <<< ${payload})"
        [[ -n $iat && -n $exp ]] && echo "Valid for $(bc <<< "($exp - $iat)/3600/24") days"
        echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
    fi
}

kclm() {
    if [[ -x $(command -v jq) ]]; then
        jq -r .message <<< "${1}" | jq
    fi
}
