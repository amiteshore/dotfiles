" =============== vim-plug ===============
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

" =============== Coloring ===============
set termguicolors
syntax enable
colorscheme night-owl

" =============== General ===============
set number
set history=100
set showcmd
set laststatus=2
set noshowmode
set scrolloff=8
set clipboard^=unnamed,unnamedplus

" =============== Indentation ===============
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" =============== Indentation ===============
set incsearch
set hlsearch
set ignorecase
set smartcase

" Set , as mapleader
let mapleader = ","

" =============== Plugin configurations ===============

" Coc extensions
let g:coc_global_extensions = [
\  'coc-tsserver', 
\  'coc-eslint', 
\  'coc-prettier', 
\  'coc-json', 
\  'coc-css',
\  'coc-pairs', 
\  'coc-snippets'
\  ]

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Emmet
let g:user_emmet_mode='i'
imap ,, <C-y>,

" Prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Lightline
let g:lightline = { 'colorscheme': 'nightowl'}

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules'
 
" =============== Custom mappings ===============
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>Q :q!<CR>
