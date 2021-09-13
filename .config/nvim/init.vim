" =============== vim-plug ===============
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'haishanh/night-owl.vim'
Plug 'itchyny/lightline.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/vim-gitbranch'

call plug#end()

" =============== Coloring ===============
set termguicolors
syntax enable
colorscheme night-owl

" =============== General ===============
set number
set relativenumber
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

" Telescope
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>

lua << EOF
local actions = require "telescope.actions"

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<CR>"] = actions.select_tab
      }
    },
    layout_config = {
      preview_width = 0.6
    }
  }
}
EOF

" Emmet
let g:user_emmet_mode='i'
imap ,, <C-y>,

" Prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Lightline
let g:lightline = {
      \ 'colorscheme': 'nightowl',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" =============== Custom mappings ===============
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>

nnoremap <leader>t :tabnew<Space>
inoremap <leader>t <Esc>:tabnew<Space>

augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END
