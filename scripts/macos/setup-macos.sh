#!/bin/bash
source $PWD/scripts/util.sh

function install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

function update_all() {
  next "update packages"
  brew update
  check "Your system is up-to-date"
}

function sane_defaults() {
  next "prettify macOS"
  next "mouse scroll"
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
  next "finder"
  defaults write com.apple.finder AppleShowAllFiles -bool true
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
  check "System is ready"
}

# Essentials
install_homebrew

# Update system upfront
update_all

# Needed for dev
brew install coreutils curl git
brew install gpg gawk

# Apps
brew install watchman
brew install cocoapods
brew install gh
brew install powerlevel10k
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install --cask google-chrome warp visual-studio-code spotify discord bruno

# Xcode
xcode-select --install

# Dev packages
# TBD

# Macos sane defaults
sane_defaults()

# Folders
[[ ! -d "$HOME/projects" ]] && mkdir $HOME/projects && cd $HOME/projects && mkdir personal oss work

check "Your system is ready!"