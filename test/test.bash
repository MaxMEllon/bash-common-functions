#!/bin/bash

. "./test/assert.sh"
. "./src/root.bash"

echo is_exists && {
  : "引数が与えられなかったとき1が得られることを期待" && {
    assert_raises "is_exists" "1"
  }

  : "存在するコマンドを与えたとき0が得られることを期待" && {
    assert_raises "is_exists bash" "0"
  }

  : "存在しないコマンドを与えたとき1が得られることを期待" && {
    assert_raises "is_exists aaaaa" "1"
  }
  assert_end is_exists
}

echo export_path && {
  : "引数が与えられなかったとき1が得られることを期待" && {
    assert_raises "is_exists" "1"
  }

  : "指定したpathがexportされていることを期待" && {
    export_path "/path/to"
    assert_raises 'echo $PATH | grep /path/to' "0"
  }

  assert_end export_path
}

