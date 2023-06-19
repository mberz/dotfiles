function virtualenv_info {
  if [[ -n "$CONDA_DEFAULT_ENV"  ]]; then
    echo `basename $CONDA_DEFAULT_ENV`
  elif [[ -n "$VIRTUAL_ENV"  ]]; then
    echo `basename $VIRTUAL_ENV`
  fi
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Prompt left
PROMPT='%{$fg[green]%}[%D{%L:%M:%S}] '
PROMPT+="%F{yellow}%n%f"  # Magenta user name
PROMPT+="%F{yellow}@"
PROMPT+="%F{yellow}${${(%):-%m}}%f " # host name
PROMPT+='%{$fg[blue]%}($(virtualenv_info))%{$reset_color%} '
PROMPT+='%{$fg[red]%}%(!.#.»)%{$reset_color%} '

# Prompt right
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='%{$fg[blue]%}%~%{$reset_color%} $(git_prompt_info) ${return_code}'


ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$reset_color%}%{[03m%}%{$fg[blue]%}"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="!%{$reset_color%} "
