#!/bin/bash

set -ex

INSTALL_DIR="$(
	cd "$(dirname $(dirname "$0"))"
	pwd
)"
echo $INSTALL_DIR

echo "Cleaning homebrew dependencies..."
brew bundle cleanup --force --file $INSTALL_DIR/Brewfile

