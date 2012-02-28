#!/usr/bin/env zsh

# cyan        $FG[117]
# red         $FG[124]
# gray        $FG[242]
# green       $FG[077]
# purple      $FG[133]
# light green $FG[118]
# dard blue   $FG[012]

# GIT_DIRTY_COLOR=$fg[red]
# GIT_CLEAN_COLOR=$fg[green]
GIT_PROMPT_INFO=$fg_bold[cyan]
PATH_COLOR=$fg[yellow]

PROMPT='%{$PATH_COLOR%}%~%{$GIT_PROMPT_INFO%} $(git_prompt_info)$(git_prompt_status) %{$reset_color%}$ '

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$$fg[green]%} ✔"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[green]%}∆"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$FG[133]%}✭"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[yellow]%}➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[red]%}unmerged"
