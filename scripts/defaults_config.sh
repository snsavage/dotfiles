#!/usr/bin/env bash

# https://macos-defaults.com/finder/fxpreferredviewstyle.html
# ~/.macos — https://mths.be/macos
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Show all file extensions in Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Disable natural scrolling (reverse scroll direction)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

###############################################################################
# Screenshots                                                                 #
###############################################################################

# Save screenshots to the clipboard instead of desktop
defaults write com.apple.screencapture "target" -string "clipboard"

###############################################################################
# Dock                                                                        #
###############################################################################

# Set the icon size of Dock items to 40 pixels
defaults write com.apple.dock "tilesize" -int "40"

# Disable recent applications from Dock
defaults write com.apple.dock "show-recents" -bool "false"

# Disable suggested and recent apps in Dock
defaults write com.apple.dock "mru-spaces" -bool "false"

###############################################################################
# Finder                                                                      #
###############################################################################

# Show hidden files in Finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

# Add quit option to Finder menu
defaults write com.apple.finder QuitMenuItem -bool true

# Set home folder as default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dock" "Finder" "SystemUIServer"; do
	killall "${app}" &> /dev/null
done
