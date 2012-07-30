#!/bin/bash

ln -si ~/Development/dotfiles/bash/bashrc ~/.bashrc
ln -si ~/Development/dotfiles/bash/profile ~/.profile

./install-osx-dev.sh
./install-osx-tools.sh
