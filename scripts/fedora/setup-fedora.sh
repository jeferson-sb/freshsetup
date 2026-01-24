#!/bin/bash
source $PWD/scripts/util.sh

function update_all() {
  next "update packages"
  dnf check-update
  dnf upgrade
  check "Your system is up-to-date"
}

# Essentials
sudo dnf group install c-development development-tools
sudo dnf install python3-venv -y
sudo dnf install flatpak -y

# System update
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