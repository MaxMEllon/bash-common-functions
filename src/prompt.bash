true=0
false=1

border-line-by-number() {
  : ${1:?}
  local lines=`tput cols`
  for ((i=0; i<$1; i++)); do
    printf "-"
  done
}

border-line() {
  local lines=`tput cols`
  border-line-by-number $lines
}

# Repeat character by number
# $1 string - repeated character
# $2 number - repeat count
repeat-char-by-number() {
  : ${2:?}
  for ((i=0; i<$2; i++)); do
    printf "$1"
  done
}
