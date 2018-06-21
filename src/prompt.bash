true=0
false=1

border-line-by-number() {
  : ${1:?}
  local lines=`tput cols`
  for ((i=0; i<$1; i++)); do
    printf "-"
  done
  printf "\n"
}

border-line() {
  local lines=`tput cols`
  border-line-by-number $lines
}
