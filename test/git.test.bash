#!/bin/bash

. "./test/assert.sh"
. "./test/spec.sh"
. "./src/git.bash"

describe "git.is_repo" && {
  it "gitリポジトリで実行したとき0が得られることを期待" && {
    assert_raises "git.is_repo" "0"
  }

  it "gitリポジトリ外で実行したとき1が得られることを期待" && {
    cd ~  &> /dev/null 2>&1
    assert_raises "git.is_repo" "1"
    cd - &> /dev/null 2>&1
  }

  assert_end is_git_repo
}

describe "git.branch" && {
  it "gitリポジトリで実行したときbranch名が得られることを期待" && {
    assert_raises "git branch | grep `git.branch`" "0"
  }

  it "gitリポジトリ外で実行したときXが得られることを期待" && {
    cd ~  &> /dev/null 2>&1
    assert "git.branch" "X"
    cd - &> /dev/null 2>&1
  }

  assert_end git_branch
}
