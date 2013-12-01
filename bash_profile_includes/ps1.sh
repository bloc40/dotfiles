RED=31
GREEN=32
YELLOW=33

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

#function symbol {
  #local result=''

  #if git_modified; then
    #result='✗'
  #fi

  #if git_untracked; then
    #result="${result} ✭"
  #fi

  #if git_staged; then
    #result="${result} ∆"
  #fi

  #echo ${result}
#}

function git_branch_color {
  if git_repo; then
    if git_dirty; then
      echo $RED
    else
      echo $GREEN
    fi
  fi
}

function git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function ruby_version {
  echo `~/.rvm/bin/rvm-prompt`
}

print_pre_prompt () {
  #TIME=`date +%H:%M`
  #printf "\e[1;37m%$(($COLUMNS))s" "${TIME}"

  printf "\e[0;90m%$(($COLUMNS))s" $(ruby_version)
}
PROMPT_COMMAND=print_pre_prompt

export CLICOLOR=1
#export PS1="\[\033[\$(echo $YELLOW)m\]\w \[\033[\$(git_branch_color)m\]\$(git_branch) \$(symbol) \[\033[00m\]$\[\033[00m\] "
export PS1="\[\033[\$(echo $YELLOW)m\]\w \[\033[\$(git_branch_color)m\]\$(git_branch)\[\033[00m\] ۞ \[\033[00m\] "
