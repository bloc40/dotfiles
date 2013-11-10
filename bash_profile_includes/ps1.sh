#-------------------------------------------
# http://stackoverflow.com/questions/4133904/ps1-line-with-git-current-branch-and-colors/6086978#6086978#answer-6086978
#function color_my_prompt {
#  local __user_and_host="\[\033[01;32m\]\u@\h"
#  local __cur_location="\[\033[01;34m\]\w"
#  local __git_branch_color="\[\033[31m\]"
#  #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
#  local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
#  local __prompt_tail="\[\033[35m\]$"
#  local __last_color="\[\033[00m\]"
#  export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
#}
#color_my_prompt

#----------------------------------------------
function git_repo {
  [[ `git rev-parse --is-inside-work-tree 2>/dev/null` == true ]]
}

function git_modified {
  [[ `git ls-files -m` != '' ]]
}

function git_untracked {
  [[ `git ls-files -o --exclude-standard` != '' ]]
}

function git_staged {
  [[ `git diff --staged --name-only` != '' ]]
}

function git_dirty {
  git_modified || git_untracked || git_staged
}

function git_branch_color {
  if git_repo; then
    if git_dirty; then
      echo '31'
    else
      echo '32'
    fi
  fi
}

function git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export CLICOLOR=1
export PS1="\[\033[33m\]\w \[\033[\$(git_branch_color)m\]\$(git_branch)\[\033[00m\]$\[\033[00m\] "
