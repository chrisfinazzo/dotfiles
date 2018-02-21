#!/bin/bash

set -e

function makeLinks() {
  ln -s ~/.bash_profile ~/Documents/Dotfiles/.bash_profile
  ln -s ~/.bash_prompt ~/Documents/Dotfiles/.bash_prompt
  ln -s ~/.emacs.d/init.el ~/Documents/Dotfiles/.emacs.d/init.el
  ln -s ~/.gitconfig ~/Documents/Dotfiles/.gitconfig
  ln -s ~/.gitignore_global ~/Documents/Dotfiles/.gitignore_global

  read -rp "This may overwrite existing files. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    makeLinks
  fi;
}

brew bundle
