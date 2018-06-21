true=0
false=1

which git > /dev/null 2>&1

if (( $? != 0 )); then
  return
fi

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
