#!/bin/bash

ln -si ~/Development/dotfiles/bash/bashrc ~/.bashrc
ln -si ~/Development/dotfiles/bash/profile ~/.profile

ln -si ~/Development/dotfiles/git/gitconfig ~/.gitconfig
ln -si ~/Development/dotfiles/git/gitignore ~/.gitignore

./install-osx-dev.sh
./install-osx-tools.sh
