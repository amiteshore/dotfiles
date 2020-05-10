call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

call plug#end()

set background=dark
colorscheme solarized
let g:solarized_termcolors=256                                                  

" Change mapleader
let mapleader=","

" Show hidden files & directories in NERDTree
let NERDTreeShowHidden=1

map <C-o> :NERDTreeToggle<CR>

set title
set number
syntax on
set tabstop=2
set ignorecase
set incsearch
set laststatus=2
set ruler
set showmode
