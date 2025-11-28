#
# Helpful commands when developing.
#

#
# Decode a JWT, call as `jwtd '<JWT>'`
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

#
# Format a Keycloak message.
#
kclm() {
    if [[ -x $(command -v jq) ]]; then
        jq -r .message <<< "${1}" | jq
    fi
}

#
# List requests sent the mail service mock.
#
wm_mails() {
  http localhost:8000/__admin/requests \
    | jq '.requests.[].request | select(.url | contains("/api/mails/")) | {url, body: (.body | fromjson)}' 
}

#
# Get the E-Mail otp code. It does so by fetching the recorded requests from wiremock.
#
wm_otp() {
  curl -s localhost:8000/__admin/requests \
    | jq -r '.requests[] | select (.request.url == "/api/mails/login_email_otp_code") | .request.body' \
    | jq -r .fields.t_code \
    | tee $TTY \
    | c
}

#
# Get the image tag of the deployed rewe keycloak and 
#
rewe_sso_pre_version() {
    git log --oneline -1 $(
      kubectl get pods -n sso-pre -o jsonpath='{.items[*].spec.containers[*].image}' \
        | tr ' ' '\n' \
        | grep keycloak \
        | cut -d':' -f 2 \
        | uniq
      )
}
