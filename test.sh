#!/bin/bash
assert() {
    expected="$1"
    input="$2"

    ./9cc "$input" > tmp.s
    cc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
      echo "$input => $actual"
    else
      echo "$input => $expected expected, but got $actual"
      exit 1
    fi
}

# 整数１個がコンパイルできるか
assert 0 0
assert 42 42

# 加算、減算がコンパイルできるか
assert 21 "5+20-4"

# 空白文字のスキップが可能か
assert 41 " 12 + 34 - 5 "

echo OK