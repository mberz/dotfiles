source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/marco/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#
alias ls='ls --color=auto'

# aliases for ls with hidden files and permissions
alias la='ls --color=auto -a'
alias ll='ls --color=auto -l'
alias lla='ls --color=auto -al'

# custrom aliases
#
#alias mlint='. /usr/local/MATLAB/R2015b/bin/glnxa64/mlint'

# standard arch linux setting
PS1='[\u@\h \W]\$ '

[ -z "$TMUX" ] && export TERM=xterm-256color

#set standard cl text editor
export EDITOR="vim" 

# arduino makefile stuff
export ARDUINO_DIR=/usr/share/arduino
export ARDMK_DIR=/usr/share/arduino
export AVR_TOOLS_DIR=/usr

# powerline bash support
. /usr/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# make matlab use systems java 
export J2D_D3D=false
export MATLAB_JAVA=/usr/lib/jvm/java-7-openjdk/jre


