call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

call plug#end()

syntax on
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme solarized

" Change mapleader
let mapleader=","

" Show hidden files & directories in NERDTree
let NERDTreeShowHidden=1

map <C-o> :NERDTreeToggle<CR>

set title
set number
set tabstop=2
set ignorecase
set incsearch
set laststatus=2
set ruler
set showmode
set noshowmode

