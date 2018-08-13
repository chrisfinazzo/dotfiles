#!/bin/bash

set -e

function makeLinks() {
  ln -s ~/Documents/Dotfiles/.bash_aliases ~/.bash_aliases
  ln -s ~/Documents/Dotfiles/.bash_profile ~/.bash_profile
  ln -s ~/Documents/Dotfiles/.bash_prompt ~/.bash_prompt
  ln -s ~/Documents/Dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/Documents/Dotfiles/.gitignore_global ~/.gitignore_global

  read -rp "This may overwrite existing files. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    makeLinks
  fi;
}

brew bundle
