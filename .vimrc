" Vundle Configuration
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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

" Standard library for vim-sessions
Plugin 'xolox/vim-misc'

" Vim sessions on steroids.
Plugin 'xolox/vim-session'

" CoffeeScript with vim
Plugin 'kchmck/vim-coffee-script'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set mouse=a
set number
syntax enable
set background=dark
set hlsearch            " highlight matches

colorscheme desert

let maplocalleader = ","
let mapleader = "'"
let g:session_autosave = 'no'

" Mappings
noremap <F6> :NERDTreeToggle<CR>
inoremap <c-u> <esc>vwiU<esc>i
noremap <leader>ew :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

" Autocommands

" We control how we see several documents with these autocommands ---- {{{
augroup filetype_view
  autocmd BufNewFile,BufRead *.html setlocal nowrap
  autocmd BufNewFile,BufRead *.haml setlocal nowrap
  autocmd BufNewFile,BufRead *.prawn set filetype=ruby 
augroup END
" }}}

" Color column.
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=7
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" Prueba
