#!/bin/bash

DIR=$(dirname $0)

source $DIR/util.sh

readonly DOTS="$HOME/.dotfiles"
readonly CONFIG="$HOME/.config"

[[ ! -d "${DOTS}" ]] && cp -r .dotfiles $HOME

sudo -v

# Install all dotfiles under .dotfiles to the home directory
for DOTFILE in $(find -H $DOTS -maxdepth 2 -type f); do
  filename=$(basename "${DOTFILE}")
  next "copy $filename"

  if [[ -e "$HOME/$filename" ]]; then
    mv "$HOME/$filename" "$HOME/$filename.old"
  fi

  if [[ $DOTFILE =~ "windows" || -L "$HOME/$filename" ]]; then
    continue
  fi

  ln -s $DOTFILE "$HOME/$filename"

  check "$filename configured"
done

# Copy vim theme
[[ ! -d "$HOME/.vim" ]] && cp -r .vim $HOME

# Copy .config folder (e.g. Neovim/Lunarvim and others)
[[ ! -d "$CONFIG" ]] && cp -r .config/* $CONFIG

check "Configuration done. You might need to restart your terminal to finish the installation"
