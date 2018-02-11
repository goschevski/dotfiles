if [[ -z $ZSH_THEME_GOSCHEVSKI_PREFIX ]]; then
    ZSH_THEME_GOSCHEVSKI_PREFIX='❯'
fi

if [[ -z $ZSH_THEME_GOSCHEVSKI_GIT_PREFIX ]]; then
    ZSH_THEME_GOSCHEVSKI_GIT_PREFIX='*'
fi

PROMPT='%{$fg[cyan]%}$ZSH_THEME_GOSCHEVSKI_PREFIX %{$fg[green]%}%p %{$fg[green]%}%c %{$fg[cyan]%}$(git_prompt_info)%{$fg[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}] %{$fg[yellow]%}$ZSH_THEME_GOSCHEVSKI_GIT_PREFIX%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"
