#!/bin/bash

echo "Switching to macOS menu bar..."
#
# Stop sketchybar first
brew services stop felixkratz/formulae/sketchybar
sleep 1
#
# Restore menu bar using multiple methods
defaults write NSGlobalDomain _HIHideMenuBar -bool false
defaults write com.apple.dock autohide-menu-bar -bool false

# Use AppleScript to show menu bar
osascript -e "
tell application \"System Events\"
    tell dock preferences
        set properties to {autohide menu bar: false}
    end tell
end tell
"

# Apply changes
killall SystemUIServer 2>/dev/null
killall Dock 2>/dev/null
sleep 1
echo "macOS menu bar restored!"

# if Aerospace is running change the top gap
#

