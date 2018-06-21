true=0
false=1

colors.list() {
  result1=""
  result2=""
  result3=""
  for c in {000..255}; do
    result1="$result1\e[38;5;${c}m$c "
    result2="$result2\e[38;5;${c}m▇"
  done
  echo -n "$result1\n"
  echo -n "$result2\n"
}

# $1 number - fg color
# $2 number - bg color
colors.set() {
  : ${2:?}
  echo -n "\e[48;5;${2}m\e[38;5;${1}m"
}

colors.reset() {
  echo -n "\e[0m"
}
