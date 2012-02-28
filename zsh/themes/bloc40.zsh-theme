PROMPT='%{$fg[yellow]%}%~ %{$fg_bold[cyan]%}$(git_prompt_info)%{$reset_color%} $ '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$fg[cyan]%}"

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[red]%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$fg[red]%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$fg[yellow]%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$fg[yellow]%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$fg[green]%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[white]%}untracked"
