#!/bin/bash 
#
set -ex

echo "Installing homebrew dependencies..."
brew bundle --file ~/.dotfiles/homebrew/Brewfile


echo "Setting up Oh-my-zsh configuration file..."
ln -s -f ~/.dotfiles/zsh/zshrc ~/.zshrc
