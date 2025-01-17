#!/bin/bash

if [ -z "$CODESPACES" ]; then
    echo "Not running in Codespaces, juste skip this file..."
else
    INSTALL_DIR="$(
        cd "$(dirname $(dirname "$0"))"
        pwd
    )"
    echo $INSTALL_DIR

    echo "Installing powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    echo "Installing eza..."

    echo "Setting up Oh-my-zsh configuration file..."
    ln -s -f $INSTALL_DIR/zshrc ~/.zshrc

    echo "Configuration of Git..."
    git config --global core.excludesfile $INSTALL_DIR/global_gitignore
    git config --global core.editor nvim -f

    echo "Setting up local config..."
    mkdir -p ~/.config
    rm -rf ~/.config/nvim ~/.config/httpie
    ln -s -f $INSTALL_DIR/.config/nvim ~/.config/nvim
    ln -s -f $INSTALL_DIR/.config/httpie ~/.config/httpie
    ln -s -f $INSTALL_DIR/.config/zellij ~/.config/zellij
fi
