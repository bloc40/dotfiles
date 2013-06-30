#!/usr/bin/env zsh

#-----------------------------------------------------------
# Name        bloc40
# Author      Jamal El Milahi
#-----------------------------------------------------------

CYAN=$fg_bold[cyan]
RED=$FG[124]
GRAY=$FG[242]
GREEN=$FG[077]
PURPLE=$FG[133]
LIGHT_GREEN=$FG[118]
DARD_BLUE=$FG[012]

GIT_PROMPT_INFO=$CYAN
PATH_COLOR=$fg[yellow]

PROMPT='%{$PATH_COLOR%}%~%{$GIT_PROMPT_INFO%} $(git_prompt_info)$(git_prompt_status) %{$reset_color%}$ '
RPROMPT='%{$fg_bold[grey]%}$(~/.rvm/bin/rvm-prompt)%{$reset_color%}'

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RED%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$GREEN%} ✔"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}✖"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$RED%}⚡"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}∆"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$PURPLE%}✭"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[yellow]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
