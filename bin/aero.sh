#!/bin/bash

echo "Switching to sketchybar..."
# Method 1: Standard defaults
defaults write NSGlobalDomain _HIHideMenuBar -bool true
# Method 2: Auto-hide menu bar in all spaces
defaults write com.apple.dock autohide-menu-bar -bool true
# Method 3: Use AppleScript to hide menu bar immediately
osascript -e "tell application \"System Preferences\" to quit"
osascript -e "
tell application \"System Events\"
    tell dock preferences
        set properties to {autohide menu bar: true}
    end tell
end tell
"
# Kill relevant processes to apply changes
killall SystemUIServer 2>/dev/null
killall Dock 2>/dev/null
# Wait for changes to apply
sleep 2

# Start sketchybar
brew services start sketchybar
sleep 2
echo "Sketchybar active with menu bar hidden!"



