#!/bin/bash

set -e

function makeLinks() {
	ln -fs ~/.bash_profile ~/Documents/Dotfiles/.bash_profile
	ln -fs ~/.bash_prompt ~/Documents/Dotfiles/.bash_prompt
	ln -fs ~/.gitconfig ~/Documents/Dotfiles/.gitconfig
	ln -fs ~/.gitignore_global ~/Documents/Dotfiles/.gitignore_global
	
	read -rp "This may overwrite existing files. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		makeLinks
	fi;

brew bundle