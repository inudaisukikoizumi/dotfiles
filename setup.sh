#!/bin/bash

mkdir -p $HOME/dotfiles/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim $HOME/dotfiles/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc $HOME/dotfiles/.vim/bundle/vimproc

for file in `find $HOME/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | grep -v 'dotfiles/.gitignore$' | grep -v 'dotfiles/.tmux$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
