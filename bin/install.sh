#!/bin/bash

set -ex

INSTALL_DIR="$(cd "$(dirname $(dirname "$0"))"; pwd)"
echo $INSTALL_DIR

echo "Creating a link to dotfiles folder..."
ln -s -f $INSTALL_DIR ~/.dotfiles

echo "Installing homebrew dependencies..."
brew bundle --file $INSTALL_DIR/Brewfile

echo "Setting up Oh-my-zsh configuration file..."
ln -s -f $INSTALL_DIR/zshrc ~/.zshrc

echo "Configuration of Git..."
git config --global core.excludesfile $INSTALL_DIR/global_gitignore
git config --global core.editor nvim -f

echo "Setting up nvim..."
mkdir -p ~/.config
rm -rf ~/.config/nvim
ln -s -f $INSTALL_DIR/config/nvim ~/.config/nvim

echo "Copying ideavimrc file..."
ln -s -f $INSTALL_DIR/ideavimrc ~/.ideavimrc

# Setting Zsh as default shell
echo "Setting default shelel if not already done : "
echo "Run the following command : "
echo "    chsh -s /opt/homebrew/bin/zsh"
