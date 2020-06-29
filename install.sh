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

echo "Copying .vimrc"

if [ ! -a ~/.vimrc ]; then
  cp .vimrc ~ 
fi

echo "Installing Plugins"
vim -c "PlugInstall" -c "qa"

echo "Adding UltiSnips"
if [ ! -d ~/.vim/UltiSnips ]; then
  mkdir ~/.vim/UltiSnips
fi

git clone https://github.com/RubenSerradas/snippets.git
echo "Copying snippets"
cp ./snippets/UltiSnips/* ~/.vim/UltiSnips/
rm -rf "snippets"
