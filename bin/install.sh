#!/bin/bash

set -ex

echo "Installing homebrew dependencies..."
brew bundle --file ~/.dotfiles/Brewfile

echo "Setting up Oh-my-zsh configuration file..."
ln -s -f ~/.dotfiles/zshrc ~/.zshrc

echo "Configuration of Git..."
git config --global core.excludesfile ~/.dotfiles/global_gitignore
git config --global core.editor nvim -f

echo "Setting up nvim..."
mkdir -p ~/.config
rm -rf ~/.config/nvim
ln -s -f ~/.dotfiles/config/nvim ~/.config/nvim

echo "Copying ideavimrc file..."
ln -s -f ~/.dotfiles/ideavimrc ~/.ideavimrc

