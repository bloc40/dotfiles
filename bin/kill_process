#!/bin/sh

kill_process() {
  if [[ $# > 1 ]]; then
    echo 'Need to surround the process with ""'
  elif [[ $# > 0 ]]; then
    ps ax | grep "$1" | grep -v grep | awk '{print $1}' | xargs kill -9
  else
    echo 'Need to pass in the process to kill'
  fi
}
