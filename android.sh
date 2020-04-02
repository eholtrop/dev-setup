#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# fastlane
sudo gem install fastlane -NV

brew tap caskroom/versions

brew cask install --appdir="~/Applications" java8
# brew cask install --appdir="~/Applications" intellij-idea-ce
brew cask install --appdir="~/Applications" android-studio

brew cask install android-sdk

# a command line program for sharing your device screen with your laptop
# https://github.com/Genymobile/scrcpy
brew install scrcpy

# Remove outdated versions from the cellar.
brew cleanup
