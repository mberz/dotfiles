source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/marco/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
#
####################################################################################
# custrom aliases
alias ls='ls --color=auto'

# aliases for ls with hidden files and permissions
alias la='ls --color=auto -al'
alias ll='ls --color=auto -l'
# alias lla='ls --color=auto -al'

# alias for xdg-open
alias open='xdg-open'

####################################################################################
# standard arch linux setting
PS1='[\u@\h \W]\$ '

[ -z "$TMUX" ] && export TERM=xterm-256color

####################################################################################
#set standard cl text editor
export EDITOR="vim" 

####################################################################################
# arduino makefile stuff
export ARDUINO_DIR=/usr/share/arduino
export ARDMK_DIR=/usr/share/arduino
export AVR_TOOLS_DIR=/usr

####################################################################################
# powerline bash support
. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

# make matlab use systems java 
export J2D_D3D=false
# export MATLAB_JAVA=/usr/lib/jvm/java-7-openjdk/jre

# export matlab for jupyter
export MATLAB_EXECUTABLE=/usr/local/MATLAB/R2016b/bin/matlab

####################################################################################
# bindings to search history in zsh
bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
