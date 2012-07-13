# -------------------------------------------------------------------------------------------------
# Author: Jamal El Milahi
# Based on Geoffrey Grosenbach's peepcode zsh theme from https://github.com/topfunky/zsh-simple
# -------------------------------------------------------------------------------------------------

git_repo_path() {
  git rev-parse --git-dir 2>/dev/null
}

git_commit_id() {
  git rev-parse --short HEAD 2>/dev/null
}

git_position() {
  set -- `git rev-list --left-right --count origin/master..HEAD`
  local behind="$1"
  local ahead="$2"

  if [[ behind -gt 0 ]]; then
    echo "%{$fg_bold[grey]%}[%{$fg_bold[blue]%}-${behind}%{$fg_bold[grey]%}]"
  elif [[ ahead -gt 0 ]]; then
    echo "%{$fg_bold[grey]%}[%{$fg_bold[blue]%}+${ahead}%{$fg_bold[grey]%}]"
  fi
}

git_branch_color() {
  if [[ $(git_repo_path) != '' ]]; then
    if [[ `git ls-files -m` != '' || `git ls-files -o --exclude-standard` != '' || `git diff --staged --name-only` != '' ]]; then
      echo 'red'
    else
      echo 'green'
    fi
  fi
}

git_dirty() {
  local result=''
  # modified
  if [[ `git ls-files -m` != '' ]]; then
    result="${result} %{$fg_bold[red]%}✗%{$reset_color%}"
  fi

  # untracked
  if [[ `git ls-files -o --exclude-standard` != '' ]]; then
    result="${result} %{$FG[133]%}✭%{$reset_color%}"
  fi

  # staged
  if [[ `git diff --staged --name-only` != '' ]]; then
    result="${result} %{$FG[077]%}∆%{$reset_color%}"
  fi

  # unmerged
  if [[ `git ls-files -u` != '' ]]; then
    result="${result} %{$fg_bold[red]%}⚡%{$reset_color%}"
  fi

  # deleted
  if [[ `git ls-files -d` != '' ]]; then
    result="${result} %{$fg_bold[red]%}✖%{$reset_color%}"
  fi

  echo ${result}
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
