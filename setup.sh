#!/bin/bash

set -e

function makeLinks() {
  ln -s ~/Documents/Dotfiles/.bash_aliases ~/.bash_aliases
  ln -s ~/Documents/Dotfiles/.bash_profile ~/.bash_profile
  ln -s ~/Documents/Dotfiles/.bash_prompt ~/.bash_prompt
  ln -s ~/Documents/Dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/Documents/Dotfiles/.gitignore_global ~/.gitignore_global
}

read -rp "Did you remember to install Homebrew? If not, do that first (https://brew.sh). Are you sure you want to continue? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew bundle
  fi;

read -rp "Do you want to save a copy of your Brewfile? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    cd ~/Desktop && brew bundle dump
  fi;

read -rp "Did you remember to install Git? If not, do that now.
This may overwrite existing files. Are you sure you want to continue? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    makeLinks
  fi;
