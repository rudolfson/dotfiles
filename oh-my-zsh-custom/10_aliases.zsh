#
# Common aliases not belonging to a specific category
#

alias grepsrc='grep --exclude-dir={node_modules,bin,build,target,dist}'
alias c='xclip -selection clipboard'
alias v='xclip -o -selection clipboard'

if ! whence bat > /dev/null
then
  if whence batcat > /dev/null
  then
    alias bat=batcat
  fi
fi

if ! whence fd > /dev/null
then
  if whence fdfind > /dev/null
  then
    alias fd=fdfind
  fi
fi
