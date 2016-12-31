#!/bin/bash - 
#===============================================================================
#
#          FILE: bringVimConfig.sh
# 
#         USAGE: scripts/bringVimConfig.sh 
# 
#        AUTHOR: Ruben Serradas
#       CREATED: 31/12/16 14:42
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

cp ~/.vimrc .
