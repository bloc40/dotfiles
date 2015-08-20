#!/bin/sh

# export GIT_EDITOR=vim

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
