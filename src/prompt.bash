true=0
false=1

# Repeat character by number
# $1 string - repeated character
# $2 number - repeat count
repeat-char-by-number() {
  : ${2:?}
  local str=""
  for ((i=0; i<$2; i++)); do
    str="$str$1"
  done
  printf "$str"
}

border-line-by-number() {
  : ${1:?}
  repeat-char-by-number "-" $1
}

border-line() {
  local lines=`tput cols`
  border-line-by-number $lines
}
