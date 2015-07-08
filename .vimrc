" Vundle Configuration
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Plugin for rails development
Plugin 'tpope/vim-rails'

" It completes the ends in Ruby
Plugin 'tpope/vim-endwise'

" Checks for syntactics errors
Plugin 'scrooloose/syntastic'

" NERDTree a must have
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal autoindent
setlocal smartindent
set mouse=a
set number
syntax enable
set background=dark
colorscheme desert
let maplocalleader = ","
let mapleader = "'"

" Mappings
noremap <F8> :NERDTreeToggle<CR>
inoremap <c-u> <esc>vwiU<esc>i
noremap <leader>ew :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" Autocommands
augroup filetype_view
  autocmd BufNewFile,BufRead *.html setlocal nowrap
  autocmd BufNewFile,BufRead *.haml setlocal nowrap
  autocmd BufNewFile,BufRead *.prawn set filetype=ruby 
augroup END

