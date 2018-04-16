describe() {
  : ${1:?}
  printf "\n$1\n"
}

it() {
  : ${1:?}
  printf "\t ⇒ $1\n"
}
