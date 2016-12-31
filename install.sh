#!/bin/bash - 
#===============================================================================
#
#          FILE: install.sh
# 
#         USAGE: ./install.sh 
# 
#   DESCRIPTION: Install a vimrc with VimBundle
# 
#        AUTHOR: Ruben Serradas
#       CREATED: 31/12/16 13:39
#      REVISION:  1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [ -d "~/.vim" ]; then
  echo ".vim folder already created"
else 
  echo "Creating .vim folder"
  mkdir "~/.vim"
fi

if [ -d "~/.vim/bundle" ]; then
  echo "Vim Vundle folder is already created"
else
  echo "Creating .vim/bundle folder"
  mkdir "~/.vim/bundle"
fi

if [ -d "~/.vim/bundle/Vundle.vim" ]; then
  echo "Vim Vundle already installed"
else
  echo "Downloading vim Vundle"
  git clone "https://github.com/VundleVim/Vundle.vim.git" "~/.vim/bundle/Vundle.vim"
fi

echo "Copying .vimrc"

if [ ! -a "$~/.vimrc" ]; then
  cp .vimrc ~ 
fi

echo "Installing Plugins"
vim -c "PluginInstall" -c "qa"

echo "Adding UltiSnips"
if [ ! -d "~/.vim/UltiSnips" ]; then
  mkdir "~/.vim/UltiSnips"
fi

git clone https://github.com/RubenSerradas/snippets.git
echo "Copying snippets"
cp ./snippets/UltiSnips/* \~/.vim/UltiSnips/
rm -rf "snippets"
