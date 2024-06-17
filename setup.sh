#!/bin/bash

set -e

function makeLinks() {
  ln -s ~/Documents/Dotfiles/.zshrc ~/.zshrc
  ln -s ~/Documents/Dotfiles/.curlrc ~/.curlrc
  ln -s ~/Documents/Dotfiles/.codespellrc ~/.codespellrc
  ln -s ~/Documents/Dotfiles/.wgetrc ~/.wgetrc
  ln -s ~/Documents/Dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/Documents/Dotfiles/.gitignore_global ~/.gitignore_global
  ln -s ~/Documents/Dotfiles/.hushlogin ~/.hushlogin
  ln -s ~/Documents/Dotfiles/.bc ~/.bc
  ln -s ~/Documents/Dotfiles/.emacs.d/init.el ~/.emacs.d/init.el
  sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
}

echo "Did you remember to install Homebrew? If not, do that first. (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew bundle && pipx ensurepath
  else
    open https://brew.sh
  fi;

echo "Do you want to save a copy of your Brewfile? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    ~/Desktop && brew bundle dump
  fi;

echo "Almost done! Do you want to continue? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    makeLinks && chsh -s /usr/local/bin/zsh
  fi;
  
  exec $SHELL && brew doctor
