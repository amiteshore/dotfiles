set number
set relativenumber

set splitright
set splitbelow

set signcolumn=yes
set colorcolumn=80
set showmode
set laststatus=2

set scrolloff=8
set history=1000
set updatetime=300
set clipboard=unnamedplus
set shortmess+=c

set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set incsearch
set hlsearch
set ignorecase
set smartcase

set rtp+=/opt/homebrew/opt/fzf

syntax on
filetype plugin indent on

let mapleader=","

nnoremap <leader>a ggVG
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <leader>t :NERDTreeToggle<CR>

" FZF
nnoremap ;f :Files<CR>
nnoremap ;g :Rg<CR>
nnoremap ;b :Buffers<CR>

" Resize splits
nnoremap -+ :resize +2<CR>
nnoremap -- :resize -2<CR>
nnoremap <leader>+ :vertical resize +2<CR>
nnoremap <leader>- :vertical resize -2<CR>

" Normal mode = block, Insert mode = vertical bar
set guicursor=n-v-c:block,i:ver25
