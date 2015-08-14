#!/bin/sh

# export GIT_EDITOR=vim

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

gcm() {
  git commit -m "$*"
}

gll() {
  args='%Cgreen%h %Cred%d%Creset %s%Creset %C(black bold)(%cr)%Creset %Cblue<%an>%Creset'
  if [[ $# > 0 ]]; then
    git log -$@ --graph --all --pretty=format:"$args"
  else
    git log --graph --all --pretty=format:"$args"
  fi
}
