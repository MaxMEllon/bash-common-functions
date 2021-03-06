true=0
false=1

# Check to exist a command
# $1 string - command name
is_exists() {
  : ${1:?}
  which $1 > /dev/null 2>&1
  return $?
}

# Export given a path to $PATH
# $1 string - command name
export_path() {
  : ${1:?}
  export PATH=$1:$PATH
}

# Remove given a path from $PATH
# $1 string - command name
remove_path() {
  : ${1:?}
  export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//')
}

# Check given alias to already defined or not.
# $1 string - alias name
has_alias() {
  : ${1:?}
  alias $1 && return $true || return $false
}

# Check current platform name
os_type() {
  if [[ "$(uname)" == 'Darwin' ]]; then
    echo 'mac'
  elif [[ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]]; then
    echo 'linux'
  elif [[ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]]; then
    echo 'cygwin'
  else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
  fi
}

: && {
  for p in mac linux cygwin; do
    eval "function is_$p { [[ \"$(os_type)\" == \"$p\" ]] && return $true || return $false; }"
  done
}

# Check given string to running or not.
# $1 string - fuzzy command name
has_process() {
  : ${1:?}
  if is_osx; then
    ps -fU$USER | grep $1 | grep -v grep > /dev/null 2>&1 && return $true || return $false
  else
    ps aux | grep $1 | grep -v grep > /dev/null 2>&1 && return $true || return $false
  fi
}

# Check given file in current directory.
# $1 string - file name
has_file() {
  : ${1:?}
  [[ -f $1 ]] && return $true || return $false
}

has_env() {
  : ${1:?}
  [[ -z $1 ]] && return $false || return $true
}

strlen() {
  : ${1:?}
  echo ${#1}
}

