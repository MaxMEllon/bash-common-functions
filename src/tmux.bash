true=0
false=1

which tmux > /dev/null 2>&1

if (( $? != 0 )); then
  return
fi

tmux.session-list() {
  tmux list-sessions
}
