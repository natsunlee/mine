#!/bin/bash

echo "Installing basic utilities"
brew install neovim pyenv readline xz pyright

BASEDIR=$(realpath $(dirname ${0}))
echo "Script directory determined to be ${BASEDIR}"

echo "Symlinking .gitconfig"
ln -s ${BASEDIR}/.gitconfig ~/.gitconfig
echo "Symlinking .gitignore_global"
ln -s ${BASEDIR}/.gitignore_global ~/.gitignore_global
echo "Symlinking .vimrc"
ln -s ${BASEDIR}/.vimrc ~/.vimrc
echo "Symlinking .wezterm.lua"
ln -s ${BASEDIR}/.wezterm.lua ~/.wezterm.lua
echo "Symlinking .zprofile"
ln -s ${BASEDIR}/.zprofile ~/.zprofile

source ~/.zprofile

# Ensure local bin dir exists
mkdir -p ~/.local/bin

echo "Symlinking mount_unraid"
ln -s ${BASEDIR}/.local/bin/mount_unraid ~/.local/bin/mount_unraid
echo "Symlinking unmount_unraid"
ln -s ${BASEDIR}/.local/bin/unmount_unraid ~/.local/bin/unmount_unraid
echo "Symlinking nv"
ln -s $(which nvim) ~/.local/bin/nv
