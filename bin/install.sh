#!/bin/bash 
#
set -ex

echo "Installing homebrew dependencies..."
brew bundle --file ~/.dotfiles/Brewfile


echo "Setting up Oh-my-zsh configuration file..."
ln -s -f ~/.dotfiles/zshrc ~/.zshrc

echo "Configuration of Git..."
git config --global core.excludesfile ~/.dotfiles/global_gitignore

echo "Setting up nvim..."
mkdir -p ~/.config
ln -s -f ~/.dotfiles/config/nvim ~/.config/nvim
