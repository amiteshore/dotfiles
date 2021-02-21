"
" ~/.vimrc
"

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'

call plug#end()

" =============== General configuration ===============
set number                    " Show line numbers
set history=100               " Sets how many lines of history VIM has to remember
set laststatus=2              " Display statusline always
set showcmd                   " Show the command as it's being typed
set noshowmode                " Do not show current mode
set visualbell                " Show visual error
set noerrorbells              " Disable error bells

filetype plugin on
filetype indent on

" =============== Set background ===============
syntax enable
set background=dark
colorscheme solarized

" =============== Indentation ===============
set expandtab                 " Use spaces instead of tabs
set smarttab
set shiftwidth=2
set tabstop=2

set wrap                      " Wrap lines
set textwidth=79
set linebreak


" =============== Search ===============
set incsearch                 " Show results as you type
set hlsearch                  " Highlight search results
set ignorecase                " Ignore case when searching
set smartcase

" Lightline
let g:lightline = { 'colorscheme': 'solarized'}
