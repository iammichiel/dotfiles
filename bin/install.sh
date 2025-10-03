#!/bin/bash

set -ex

INSTALL_DIR="$(
	cd "$(dirname $(dirname "$0"))"
	pwd
)"
echo $INSTALL_DIR

echo "Setting up Oh-my-zsh/Wezterm configuration file..."
ln -s -f $INSTALL_DIR/zshrc ~/.zshrc
ln -s -f $INSTALL_DIR/wezterm.lua ~/.wezterm.lua

echo "Configuration of Git..."
git config --global core.excludesfile $INSTALL_DIR/global_gitignore
git config --global core.editor nvim -f

echo "Setting up local config..."
mkdir -p ~/.config
rm -rf ~/.config/nvim ~/.config/httpie ~/.config/tmux ~/.config/skhd
ln -s -f $INSTALL_DIR/config/nvim ~/.config/nvim
ln -s -f $INSTALL_DIR/config/httpie ~/.config/httpie
ln -s -f $INSTALL_DIR/config/tmux ~/.config/tmux
ln -s -f $INSTALL_DIR/config/docker ~/.docker

echo "Copying ideavimrc file..."
ln -s -f $INSTALL_DIR/ideavimrc ~/.ideavimrc

echo "Copying tmux.conf file..."
ln -s -f $INSTALL_DIR/tmux.conf ~/.tmux.conf

echo "Copying Zscaler.pem file..."
ln -s -f $INSTALL_DIR/zscaler.pem ~/.zscaler.pem

# Setting Zsh as default shell
echo "Setting default shell if not already done : "
echo "Run the following command : "
echo "    chsh -s /opt/homebrew/bin/zsh"

echo "⚠️ Homebrew packages are installed using another command : bin/brew.sh"
