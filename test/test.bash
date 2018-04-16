#!/bin/bash

. "./test/assert.sh"
. "./test/spec.sh"
. "./src/root.bash"

describe is_exists && {
  it "存在するコマンドを与えたとき0が得られることを期待" && {
    assert_raises "is_exists bash" "0"
  }

  it "存在しないコマンドを与えたとき1が得られることを期待" && {
    assert_raises "is_exists aaaaa" "1"
  }
  assert_end is_exists
}

describe export_path && {
  it "指定したpathがexportされていることを期待" && {
    export_path "/path/to"
    assert_raises 'describe $PATH | grep /path/to' "0"
  }

  assert_end export_path
}

describe remove_path && {
  it "指定したpathが削除されていることを期待" && {
    export_path "/path/to"
    remove_path "/path/to"
    assert_raises 'describe $PATH | grep /path/to' "1"
  }

  assert_end remove_path
}

describe has_alias && {
  it "定義済みエイリアスを与えたとき0が得られることを期待" && {
    alias sample="sample"
    assert_raises "has_alias sample" "0"
    unalias sample
  }

  it "未定義エイリアスを与えたとき1が得られることを期待" && {
    assert_raises "has_alias sample" "1"
  }

  assert_end has_alias
}

describe "has_process" && {
  it "実行中でないプロセスのコマンド名を与えたとき0が得られることを期待" && {
    assert_raises "has_process sample" "1"
  }

  it "実行中であるプロセスのコマンド名を与えたとき0が得られることを期待" && {
    sleep 1 &
    assert_raises "has_process sleep" "0"
  }

  assert_end has_process
}

describe "has_file" && {
  it "存在するfileを指定したとき0が得られることを期待" && {
    touch sample.hoge
    assert_raises "has_file sample.hoge" "0"
    rm -rf sample.hoge
  }

  it "存在しないfileを指定したとき1が得られることを期待" && {
    assert_raises "has_file sample" "1"
  }

  assert_end has_file
}

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
