#!/bin/sh

# unlink all existing config files
unlink ~/.vimrc
unlink ~/.vim
unlink ~/.tmux.conf
unlink ~/.tmux
unlink ~/.zprofile
unlink ~/.zshrc
unlink ~/.oh-my-zsh/custom
rm -rf ~/.oh-my-zsh/custom


# copy dotfiles for vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim

# copy dotfiles for zsh
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/zprofile ~/.zprofile
# oh my zsh custom
ln -s ~/dotfiles/oh-my-zsh/custom ~/.oh-my-zsh/custom


# copy dotfiles for tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux ~/.tmux


