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

is_git_repo() {
  git rev-parse --is-inside-work-tree &> /dev/null 2>&1  && return $true || return $false
}

git_branch() {
  if is_git_repo; then
    branch=$(git symbolic-ref --short HEAD)
    echo $branch
    return 0
  else
    echo "X"
    return 1
  fi
}
