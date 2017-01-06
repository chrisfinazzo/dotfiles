# My dotfiles

Bash, Git, Ruby, etc.

## Requirements

The only prerequisites are a working Git installation and [Homebrew][], which
is required if you want to use the Brewfile.

[Homebrew]: http://brew.sh

## Installation

To get started, clone this repository into the directory where you want to keep your dotfiles - I like to use `~/Documents/Dotfiles`. Next, run `setup.sh` to make symlinks between `$HOME` and the repository. The script will warn you before doing anything, so this is a safe thing to do.

```sh
$ git clone https://github.com/chrisfinazzo/dotfiles.git ~/Documents/Dotfiles
$ cd ~/Documents/Dotfiles
$ ./setup.sh
```
