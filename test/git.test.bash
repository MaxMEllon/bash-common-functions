#!/bin/bash

. "./test/assert.sh"
. "./test/spec.sh"
. "./src/git.bash"

describe "is_git_repo" && {
  it "gitリポジトリで実行したとき0が得られることを期待" && {
    assert_raises "is_git_repo" "0"
  }

  it "gitリポジトリ外で実行したとき1が得られることを期待" && {
    cd ~  &> /dev/null 2>&1
    assert_raises "is_git_repo" "1"
    cd - &> /dev/null 2>&1
  }

  assert_end is_git_repo
}

describe "git_branch" && {
  it "gitリポジトリで実行したときbranch名が得られることを期待" && {
    assert_raises "git branch | grep `git_branch`" "0"
  }

  it "gitリポジトリ外で実行したときXが得られることを期待" && {
    cd ~  &> /dev/null 2>&1
    assert "git_branch" "X"
    cd - &> /dev/null 2>&1
  }

  assert_end git_branch
}
