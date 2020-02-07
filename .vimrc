" Vundle Configuration
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" It completes the ends in Ruby
Plugin 'tpope/vim-endwise'

" NERDTree a must have
Plugin 'scrooloose/nerdtree'

" Show colors in CSS files.
Plugin 'ap/vim-css-color'

" Standard library for vim-sessions
Plugin 'xolox/vim-misc'

" Vim sessions on steroids.
Plugin 'xolox/vim-session'

" Automatic management of ctags
Plugin 'szw/vim-tags'

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

" Themes for the status bar.
Plugin 'vim-airline/vim-airline-themes'

" Shows a window with tags
Plugin 'majutsushi/tagbar'

" Syntax for lex & bison
Plugin 'justinmk/vim-syntax-extra'

" Align text
Plugin 'godlygeek/tabular'

"Delete all trailigin white space
Plugin 'vim-scripts/DeleteTrailingWhitespace'

" Assign commas or semicolons to files
Plugin 'lfilho/cosco.vim'

" Tern Support for Vim.
Plugin 'ternjs/tern_for_vim'

" Bash support for vim
Plugin 'bash-support.vim'

Plugin 'morhetz/gruvbox'

Plugin 'Valloric/YouCompleteMe'

Plugin 'hashivim/vim-terraform'

Plugin 'juliosueiras/vim-terraform-completion'

Plugin 'elixir-editors/vim-elixir'

Plugin 'slashmili/alchemist.vim'

Plugin 'mustache/vim-mustache-handlebars'

Plugin 'tpope/vim-fireplace'

Plugin 'vim-scripts/paredit.vim'

Plugin 'leafgarland/typescript-vim' 

Plugin 'peitalin/vim-jsx-typescript'

Plugin 'tpope/vim-salve'

Plugin 'fatih/vim-go'

Plugin 'godoctor/godoctor.vim'

Plugin 'tpope/vim-dispatch'

Plugin 'ararslan/license-to-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Let :UltiSnipsEdit to split the window
let g:UltiSnipsEditSplit="vertical"

command! CommaOrSemiColon call cosco#commaOrSemiColon()

" Airline Configuration
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='gruvbox'

" Syntastic configuration
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

colorscheme gruvbox

let mapleader = ","
let g:session_autosave = 'no'
let g:session_autoload = 'no'

let g:license_author = 'Ruben Serradas'
let g:license_email = 'rubenserradas@gmail.com'

" Mappings
noremap <leader>nt :NERDTreeToggle<CR>
noremap <F5> :NERDTree<CR>
noremap <F8> :TagbarToggle<CR>
inoremap <c-u> <esc>vwiU<esc>i
" Changes an entire string. It's pretty cool.
noremap <leader>cs <esc>v/"\\|'<cr>hc
noremap <leader>ys <esc>v/"\\|'<cr>hy
" Copies or changes code until it find a bracket.
noremap <leader>cb <esc>v/}<cr>hc
noremap <leader>yb <esc>v/}<cr>hy
" Copies or changes until it find the first parenthesis.
noremap <leader>py <esc>v/)<cr>y
noremap <leader>pc <esc>v/)<cr>c
noremap <leader>ds :DeleteTrailingWhitespace<cr>
" Vim files edit.
noremap <leader>ew :vsplit $MYVIMRC<cr>
noremap <leader>us :UltiSnipsEdit<cr>
noremap <leader>sv :source $MYVIMRC<cr>
noremap <leader>y <esc>v$hy
noremap <leader>bn :bnext<cr>
noremap <leader>bp :bprevious<cr>
" } Changes directory to the current file's directory
noremap <leader>cd :cd %:p:h<cr>
noremap <leader>tn :tabnew<cr>
noremap <leader>qt :tabclose<cr>

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

augroup html
  autocmd FileType html set shiftwidth=4
  autocmd FileType html set softtabstop=4
augroup END

augroup java_files
  autocmd FileType java set shiftwidth=4
  autocmd FileType java set softtabstop=4
augroup END

augroup go_files
  autocmd FileType go set shiftwidth=4
  autocmd FileType go set softtabstop=4
augroup END

" Color column.
if exists('+colorcolumn')
  if &filetype ==# 'rb' || &filetype ==# 'ex'
    set colorcolumn=80
  endif
  set colorcolumn=150
  highlight ColorColumn ctermbg=7
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

