# My dotfiles

Git, Homebrew, Zsh etc.

## Requirements

The only prerequisites are a working Git installation and [Homebrew][].

[Homebrew]: http://brew.sh

## Installation

To get started, clone this repository into the directory where you want to keep your dotfiles - I like to use `~/Documents/Dotfiles`. Next, run `setup.sh` to symlink the appropriate directories and install the Brewfile. The script will warn you before doing anything, so this is a safe thing to do.

```sh
$ git clone https://github.com/chrisfinazzo/dotfiles.git ~/Documents/Dotfiles
$ cd ~/Documents/Dotfiles
$ ./setup.sh
```
