#!/usr/bin/env bash

if [[ `git status --porcelain` ]]; then
  echo "There are changes. Please review them before pulling"
  exit 1
fi

git pull

if [ -f ~/.bash_aliases ]; then
    rm ~/.bash_aliases
fi
cp ./configuration/.bash_aliases ~/.bash_aliases 

if [ -f ~/.bash_functions ]; then
    rm ~/.bash_functions
fi
cp ./configuration/.bash_functions ~/.bash_functions

if [ -f ~/.tmux.conf ]; then
    rm ~/.tmux.conf
fi
cp ./configuration/.tmux.conf ~/.tmux.conf

echo "Pulled shell configuration"
