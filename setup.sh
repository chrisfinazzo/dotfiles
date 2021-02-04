#!/usr/local/bin/zsh

set -e

function makeLinks() {
  ln -s ~/Documents/Dotfiles/.zshrc ~/.zshrc
  ln -s ~/Documents/Dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/Documents/Dotfiles/.gitignore_global ~/.gitignore_global
  ln -s ~/Documents/Dotfiles/.hushlogin ~/.hushlogin
  sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
}

read -rp "Did you remember to install Homebrew? If not, do that first. Are you sure you want to continue? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew bundle
  else
    open https://brew.sh
  fi;

# `brew deps $FORMULA` shows the formula that $FOO depends on.

# `brew uses $FORMULA` shows all the formula that have declared $FOO as a dependency.

read -rp "Do you want to save a copy of your Brewfile? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    ~/Desktop && brew bundle dump
  fi;

read -rp "Did you remember to install Git? If not, do that now.
This may overwrite existing files. Are you sure you want to continue? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    makeLinks
  else
    brew install git
  fi;
