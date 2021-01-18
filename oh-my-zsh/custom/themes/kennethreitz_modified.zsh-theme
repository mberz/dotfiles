function virtualenv_info {
  if [[ -n "$CONDA_PROMPT_MODIFIER"  ]]; then
    echo `basename $CONDA_PROMPT_MODIFIER`
  elif [[ -n "$VIRTUAL_ENV"  ]]; then
    echo `basename $VIRTUAL_ENV`
  fi
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg[green]%}%c \
%{$fg[blue]%}$(virtualenv_info)%{$reset_color%} \
\
%{$fg[red]%}%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='%{$fg[blue]%}%~%{$reset_color%} $(git_prompt_info) ${return_code}'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$reset_color%}%{[03m%}%{$fg[blue]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="!%{$reset_color%} "
