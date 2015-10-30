" Vundle Configuration
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Alternate files quickly
Plugin 'vim-scripts/a.vim'

" Search stuff 
Plugin 'mileszs/ack.vim'

" Vim plugin for vim
Plugin 'vim-scripts/c.vim'

" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Plugin for rails development
Plugin 'tpope/vim-rails'

" It completes the ends in Ruby
Plugin 'tpope/vim-endwise'

" Vim with rvm
Plugin 'tpope/vim-rvm'

" Support for Haml, Sass, SCSS.
Plugin 'tpope/vim-haml'

" Checks for syntactics errors
Plugin 'scrooloose/syntastic'

" NERDTree a must have
Plugin 'scrooloose/nerdtree'

" Show colors in CSS files.
Plugin 'ap/vim-css-color'

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

" Less Vim
Plugin 'groenewege/vim-less'

" Status bar for vim
Plugin 'bling/vim-airline'

" Shows a window with tags
Plugin 'majutsushi/tagbar'

" Syntax for lex & bison
Plugin 'justinmk/vim-syntax-extra'

" Align text
Plugin 'godlygeek/tabular'

"Delete all trailigin white space
Plugin 'vim-scripts/DeleteTrailingWhitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Let :UltiSnipsEdit to split the window
let g:UltiSnipsEditSplit="vertical"

" Airline Configuration
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='raven'

" Syntastic configuration
let g:syntastic_javascript_checkers = ['eslint']

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
"set hlsearch            " highlight matches
set laststatus=2

colorscheme desert

let mapleader = ","
let g:session_autosave = 'no'

" Mappings
noremap <F6> :NERDTreeToggle<CR>
noremap <F5> :NERDTree<CR>
noremap <F8> :TagbarToggle<CR>
inoremap <c-u> <esc>vwiU<esc>i
" Changes an entire string. It's pretty cool.
noremap <leader>cs <esc>v/"\\|'<cr>hc
noremap <leader>ew :vsplit $MYVIMRC<cr>
noremap <leader>us :UltiSnipsEdit<cr>
noremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>y <esc>v$hy
noremap <leader>bn :bnext<cr>
noremap <leader>bp :bprevious<cr>
" Changes directory to the current file's directory
noremap <leader>cd :cd %:p:h<cr>
noremap <leader>tn :tabnew<cr>

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

augroup c_files
  autocmd FileType c set shiftwidth=4
  autocmd FileType c set softtabstop=4
augroup END

" Color column.
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=7
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
