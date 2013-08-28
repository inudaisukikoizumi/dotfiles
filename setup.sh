#!/bin/bash

for file in `find $HOME/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | grep -v 'dotfiles/.gitignore$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
