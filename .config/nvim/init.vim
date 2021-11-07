" =============== Plugins ===============
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
Plug 'rhysd/vim-clang-format'
Plug 'tpope/vim-surround'

call plug#end()

" =============== Coloring ===============
set termguicolors
syntax enable
colorscheme night-owl

" =============== General ===============
set number
set relativenumber
set history=100
set laststatus=2
set noshowmode
set scrolloff=8
set clipboard^=unnamed,unnamedplus
set splitright
set splitbelow

" =============== Indentation ===============
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" =============== Search ===============
set incsearch
set hlsearch
set ignorecase
set smartcase

" Format on save
autocmd FileType c,cpp ClangFormatAutoEnable

" Custom map leader
let mapleader = ','

" =============== Custom mappings ===============
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader><cr> :source %<cr>
nnoremap <leader>t :tabnew<space>

" =============== Plugin configurations ===============

" Telescope
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> ;b <cmd>Telescope buffers<cr>

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

" Coc extensions
let g:coc_global_extensions = [
\  'coc-tsserver', 
\  'coc-eslint', 
\  'coc-prettier', 
\  'coc-json', 
\  'coc-css',
\  'coc-pairs'
\  ]

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

" =============== Misc ===============
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END
