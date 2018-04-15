true=0
false=1

# Check to exist a command
# $1 string - command name
is_exists() {
  : ${1:?}
  which $1 > /dev/null 2>&1
  return $?
}


export_path() {
  : ${1:?}
  export PATH=$1:$PATH
}
