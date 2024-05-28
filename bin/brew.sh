#!/bin/bash

set -ex

echo "Installing homebrew dependencies..."
brew bundle --file $INSTALL_DIR/Brewfile
