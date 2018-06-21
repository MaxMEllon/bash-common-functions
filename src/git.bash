true=0
false=1

which git > /dev/null 2>&1

if (( $? != 0 )); then
  return
fi

git.is_repo() {
  git rev-parse --is-inside-work-tree &> /dev/null 2>&1  && return $true || return $false
}

git.diff-shortstat() {
  git diff --shortstat | awk '{print " +" $4 " -" $6 " "}' | tr -d '\n'
}

git.branch() {
  if git.is_repo; then
    local branch=$(git symbolic-ref --short HEAD)
    echo $branch
    return 0
  else
    echo "X"
    return 1
  fi
}
