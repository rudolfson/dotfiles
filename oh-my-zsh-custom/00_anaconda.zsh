setup_conda() {
  __conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 3> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
          . "/opt/anaconda/etc/profile.d/conda.sh"
      else
          export PATH="/opt/anaconda/bin:$PATH"
      fi
  fi
  unset __conda_setup
}
