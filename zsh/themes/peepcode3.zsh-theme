# -------------------------------------------------------------------------------------------------
# Author: Jamal El Milahi
# Based on Geoffrey Grosenbach's peepcode zsh theme from https://github.com/topfunky/zsh-simple
# -------------------------------------------------------------------------------------------------

git_repo_path() {
  git rev-parse --git-dir 2>/dev/null
}

git_position() {
  set -- `git rev-list --left-right --count origin/master..HEAD 2>/dev/null`
  local behind="$1"
  local ahead="$2"

  if [[ behind -gt 0 ]]; then
    echo "%{$fg_bold[grey]%}(%{$fg_bold[blue]%}-${behind}%{$fg_bold[grey]%})"
  elif [[ ahead -gt 0 ]]; then
    echo "%{$fg_bold[grey]%}(%{$fg_bold[blue]%}+${ahead}%{$fg_bold[grey]%})"
  fi
}

git_number_of_modified() {
  set -- `git status --porcelain 2>/dev/null | egrep '^( M| D)' | wc -l`
  echo "$1"
}

git_number_of_untracked() {
  set -- `git status --porcelain 2>/dev/null | grep '^??' | wc -l`
  echo "$1"
}

git_number_of_staged() {
  set -- `git status --porcelain 2>/dev/null | egrep '^(M|A|D)' | wc -l`
  echo "$1"
}

git_number_of_deleted() {
  set -- `git status --porcelain 2>/dev/null | grep '^ D' | wc -l`
  echo "$1"
}

git_modified() {
  [[ `git ls-files -m` != '' ]]
}

git_untracked() {
  [[ `git ls-files -o --exclude-standard` != '' ]]
}

git_staged() {
  [[ `git diff --staged --name-only` != '' ]]
}

git_deleted() {
  [[ `git ls-files -d` != '' ]]
}

git_unmerged() {
  [[ `git ls-files -u` != '' ]]
}

git_dirty() {
  local result=''

  git_modified && result="${result} %{$fg_bold[red]%}$(git_number_of_modified)✗%{$reset_color%}"
  git_untracked && result="${result} %{$FG[133]%}$(git_number_of_untracked)✭%{$reset_color%}"
  git_staged && result="${result} %{$FG[077]%}$(git_number_of_staged)∆%{$reset_color%}"
  git_unmerged && result="${result} %{$fg_bold[red]%}⚡%{$reset_color%}"
  git_deleted && result="${result} %{$fg_bold[red]%}$(git_number_of_deleted)✖%{$reset_color%}"
  echo ${result}
}

git_branch_color() {
  if git_modified || git_untracked || git_staged; then
    echo 'red'
  else
    echo 'green'
  fi
}

git_prompt() {
  local cb=$(current_branch)

  if [ -n "$cb" ]; then
    echo "%{$fg_bold[$(git_branch_color)]%} $cb $(git_position)%{$reset_color%}$(git_dirty)"
  fi
}

local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%{$fg[yellow]%}%~
${smiley}  %{$reset_color%}'
RPROMPT='%{$fg_bold[grey]%} $(~/.rvm/bin/rvm-prompt)$(git_prompt)%{$reset_color%}'
