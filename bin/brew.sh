#!/bin/bash

set -ex

INSTALL_DIR="$(
	cd "$(dirname $(dirname "$0"))"
	pwd
)"
echo $INSTALL_DIR

echo "Installing homebrew dependencies..."
brew bundle --file $INSTALL_DIR/Brewfile
