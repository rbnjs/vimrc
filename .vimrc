" Vundle Configuration
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Search stuff 
Plugin 'mileszs/ack.vim'

" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Plugin for rails development
Plugin 'tpope/vim-rails'

" It completes the ends in Ruby
Plugin 'tpope/vim-endwise'

" Vim with rvm
Plugin 'tpope/vim-rvm'

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

" Automatic management of ctags
Plugin 'szw/vim-tags'

" Autoclose [], {}, ...
Plugin 'Townk/vim-autoclose'

" Snippets Engine for Vim.
Plugin 'SirVer/ultisnips'

" Snippets 
Plugin 'honza/vim-snippets'

" JavaScript bundle for Vim
Plugin 'pangloss/vim-javascript'

" JSX for Vim
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window
let g:UltiSnipsEditSplit="vertical"

syntax on
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set mouse=a
set relativenumber
syntax enable
set background=dark
set hlsearch            " highlight matches

colorscheme desert

let mapleader = ","
let g:session_autosave = 'no'

" Mappings
noremap <F6> :NERDTreeToggle<CR>
noremap <F5> :NERDTree<CR>
inoremap <c-u> <esc>vwiU<esc>i
" Changes an entire string. It's pretty cool.
noremap <leader>cs <esc>v/"\\|'<cr>hc
noremap <leader>ew :vsplit $MYVIMRC<cr>
noremap <leader>us :UltiSnipsEdit<cr>
noremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>y <esc>v$hy

" Autocommands

" We control how we see several documents with these autocommands ---- {{{
augroup filetype_view
  autocmd BufNewFile,BufRead *.html setlocal nowrap
  autocmd BufNewFile,BufRead *.haml setlocal nowrap
  autocmd BufNewFile,BufRead *.prawn set filetype=ruby 
  autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby 
augroup END
" }}}

augroup ruby_files
  autocmd FileType ruby noremap <leader>c <esc>i#<esc>
augroup END

" Color column.
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=7
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
