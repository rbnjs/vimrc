if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

" Plug on GitHub repo
Plug 'tpope/vim-fugitive'

" It completes the ends in Ruby
Plug 'tpope/vim-endwise'

" NERDTree a must have
Plug 'scrooloose/nerdtree'

" Show colors in CSS files.
Plug 'ap/vim-css-color'

" Standard library for vim-sessions
Plug 'xolox/vim-misc'

" Vim sessions on steroids.
Plug 'xolox/vim-session'

" Automatic management of ctags
Plug 'szw/vim-tags'

" Snippets Engine for Vim.
Plug 'SirVer/ultisnips'

" Snippets
Plug 'honza/vim-snippets'

" JavaScript bundle for Vim
Plug 'pangloss/vim-javascript'

" JSX for Vim
Plug 'mxw/vim-jsx'

" Less Vim
Plug 'groenewege/vim-less'

Plug 'dpelle/vim-LanguageTool'

" Status bar for vim
Plug 'bling/vim-airline'

" Themes for the status bar.
Plug 'vim-airline/vim-airline-themes'

" Shows a window with tags
Plug 'majutsushi/tagbar'

" Syntax for lex & bison
Plug 'justinmk/vim-syntax-extra'

" Align text
Plug 'godlygeek/tabular'

"Delete all trailigin white space
Plug 'vim-scripts/DeleteTrailingWhitespace'

" Assign commas or semicolons to files
Plug 'lfilho/cosco.vim'

" Tern Support for Vim.
Plug 'ternjs/tern_for_vim'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'sheerun/vim-polyglot'

Plug 'hashivim/vim-terraform'

Plug 'juliosueiras/vim-terraform-completion'

Plug 'elixir-editors/vim-elixir'

Plug 'slashmili/alchemist.vim'

Plug 'mustache/vim-mustache-handlebars'

Plug 'tpope/vim-rails'

Plug 'vim-scripts/paredit.vim'

Plug 'leafgarland/typescript-vim' 

Plug 'peitalin/vim-jsx-typescript'

Plug 'tpope/vim-salve'

Plug 'fatih/vim-go'

Plug 'godoctor/godoctor.vim'

Plug 'tpope/vim-dispatch'

Plug 'ararslan/license-to-vim'

call plug#end()

let g:deoplete#enable_at_startup = 1

" Trigger configuration.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Let :UltiSnipsEdit to split the window
let g:UltiSnipsEditSplit="vertical"

command! CommaOrSemiColon call cosco#commaOrSemiColon()

" Airline Configuration
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='tomorrow'

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

colorscheme desert

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

autocmd FileType markdown setlocal spell
autocmd FileType markdown.mdx setlocal spell

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
