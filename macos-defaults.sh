#!/usr/bin/env bash
#
# macos-defaults.sh
# Re-applies standard macOS System Settings after a fresh install / wipe.
# Safe to re-run any time — every setting is idempotent.
#
# Usage: ./macos-defaults.sh

set -euo pipefail

echo "Applying macOS defaults..."

###############################################################################
# Trackpad
###############################################################################

# Enable tap to click (for the current user and at the login screen)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Slightly faster tracking speed than default
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 1.5

###############################################################################
# Keyboard
###############################################################################

# Fast key repeat, short delay until repeat kicks in
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold for accented characters in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable automatic spelling correction (handy if you live in a terminal)
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Dock
###############################################################################

# Minimize windows into their application's icon, not a separate Dock entry
defaults write com.apple.dock minimize-to-application -bool true

# Auto-hide the Dock
#defaults write com.apple.dock autohide -bool true

# Don't show recently-used apps in the Dock
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Finder
###############################################################################

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# New Finder windows open to home folder instead of "Recents"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Default to list view in every Finder window
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

###############################################################################
# Screenshots
###############################################################################

# Save location — adjust this path to wherever you actually want them
mkdir -p "${HOME}/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

# PNG format (default, but explicit)
defaults write com.apple.screencapture type -string "png"

# Disable the shadow around window screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Mission Control / Hot Corners
###############################################################################

# Bottom-right hot corner -> Desktop (14 = Show Desktop)
defaults write com.apple.dock wvous-br-corner -int 14
defaults write com.apple.dock wvous-br-modifier -int 0

###############################################################################
# General / misc
###############################################################################

# Save to disk (not iCloud) by default when saving new documents
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Disable the "Are you sure you want to open this application?" Gatekeeper
# dialog for apps you downloaded yourself. (Comment out if you'd rather keep it.)
# defaults write com.apple.LaunchServices LSQuarantine -bool false

###############################################################################
# Restart affected apps
###############################################################################

for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" &> /dev/null || true
done

echo "Done. Some changes may require a logout/restart to fully take effect."
