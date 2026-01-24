#!/bin/bash
source $PWD/scripts/util.sh

function update_all() {
  next "update packages"
  sudo apt update
  sudo apt list --upgradable
  sudo apt upgrade -y
  sudo apt --purge autoremove
  check "Your system is up-to-date"
}

# Essentials
sudo apt install build-essential -y
sudo apt install python3-venv -y
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Update system upfront
update_all

# Pre-requisites (python env)
python3 -m venv env
source env/bin/activate
pip3 install beaupy distro

# Install selected packages
python3 $PWD/scripts/install_packages.py

# Folders
[[ ! -d "$HOME/projects" ]] && mkdir $HOME/projects && cd $HOME/projects && mkdir personal oss work

check "Your system is successfully configured :)"

deactivate
