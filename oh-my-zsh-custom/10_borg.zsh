#
# Make borg backup easier
# see https://borgbackup.readthedocs.io/
#


#
# Setup ENV variables for a specific 
#
function bb_activate() {
  config_file="$HOME/.borg/repos.cfg"
  if [[ ! -f "$config_file" ]] {
    echo "missing $config_file"
    return
  }
  config="$1"
  if [[ -z "$config" ]] {
    echo "you need to pass the configuration name"
    return
  }
  if [[ $(jq 'has("'$config'")' < $config_file) == "false" ]] {
    echo "could not find config entry $config in file $config_file"
    return
  }
  if [[ $(jq '."'$config'" | has("repo")' < $config_file) == "false" ]] {
    echo "could not find repo entry in file $config_file for config $config"
    return
  }
  if [[ $(jq '."'$config'" | has("pass")' < $config_file) == "false" ]] {
    echo "could not find pass entry in file $config_file for config $config"
    return
  }

  repo=$(jq -r ".$config".repo < "$config_file")
  pass_cmd="jq -r '.$config'.pass '$config_file'"
  
  export BORG_REPO="$repo"
  export BORG_PASSCOMMAND="$pass_cmd"
}
