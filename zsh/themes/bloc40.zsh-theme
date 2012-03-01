#!/usr/bin/env zsh

# cyan        $FG[117]
# red         $FG[124]
# gray        $FG[242]
# green       $FG[077]
# purple      $FG[133]
# light green $FG[118]
# dard blue   $FG[012]
CYAN=$fg_bold[cyan]
RED=$FG[124]
GRAY=$FG[242]
GREEN=$FG[077]
PURPLE=$FG[133]
LIGHT_GREEN=$FG[118]
DARD_BLUE=$FG[012]

#GIT_DIRTY_COLOR=$fg[red]
#GIT_CLEAN_COLOR=$fg[green]
GIT_PROMPT_INFO=$CYAN
PATH_COLOR=$fg[yellow]

PROMPT='%{$PATH_COLOR%}%~%{$GIT_PROMPT_INFO%} $(git_prompt_info)$(git_prompt_status) %{$reset_color%}$ '

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RED%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$GREEN%} ✔"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_DELETED=" %{$DARK_BLUE%}✖"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$RED%}⚡"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}∆"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$PURPLE%}✭"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[yellow]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"

#ZSH_THEME_GIT_PROMPT_DELETED=" %{$FG[012]%}D"
#ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$FG[124]%}M"
#ZSH_THEME_GIT_PROMPT_ADDED=" %{$FG[118]%}A"
#ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$FG[133]%}U"
#ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[yellow]%}R"
#ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$FG[124]%}U"
