#!/bin/bash

echo "Define config folder: "
export XDG_CONFIG_HOME=$HOME/.config
mkdir -p $XDG_CONFIG_HOME
echo $XDG_CONFIG_HOME

echo "Copy configurations..."
cp -r .config/zsh/ $XDG_CONFIG_HOME
cp .config/starship.toml $XDG_CONFIG_HOME

echo "Create symbolic links for configurations..."
ln -sf $XDG_CONFIG_HOME/zsh/.zshrc $HOME/.zshrc

echo "Create ZSH cache folder: "
mkdir -p $HOME/.cache/zsh/
echo $HOME/.cache/zsh/

echo "Source .zshrc file..."
source $HOME/.zshrc

read -p "Press a key to continue ..."