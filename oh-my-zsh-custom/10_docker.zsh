#
# All Docker related stuff
#


local dockercompose
if whence docker-compose > /dev/null
then
  dockercompose=docker-compose
else
  dockercompose="docker compose"
fi
alias dcu="$dockercompose up"
alias dspv='docker system prune --volumes=true'
unset dockercompose
