" Options
lua <<EOF
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.colorcolumn = "80"
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.history = 1000
-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300
vim.opt.clipboard = vim.opt.clipboard ^ 'unnamed,unnamedplus'
-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess = vim.opt.shortmess + 'c'

-- Indentation --
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Search --
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
EOF

" Plugins
call plug#begin('~/.config/nvim/plugged')

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'

  Plug 'haishanh/night-owl.vim'
  Plug 'itchyny/lightline.vim'

  Plug 'itchyny/vim-gitbranch'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'

  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'ap/vim-css-color'

call plug#end()

" Colorscheme + Statusline
syntax enable
colorscheme night-owl
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

" Customize some colors
hi jsImport guifg=#c792ea ctermfg=176 gui=NONE cterm=NONE
hi jsFrom guifg=#c792ea ctermfg=176 gui=NONE cterm=NONE
hi jsStorageClass guifg=#c792ea ctermfg=176 gui=NONE cterm=NONE
hi jsFunction guifg=#c792ea ctermfg=176 gui=NONE cterm=NONE
hi jsObjectKey guifg=#c792ea ctermfg=176 gui=NONE cterm=NONE
hi jsObjectSeparator guifg=#c792ea ctermfg=176 gui=NONE cterm=NONE
hi jsObjectBraces guifg=#c792ea ctermfg=176 gui=NONE cterm=NONE
hi CocUnusedHighlight guifg=#8a8a8a ctermfg=245 gui=NONE cterm=NONE

" Map , as leader key
let mapleader = ','

" Mappings
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><Space> :nohlsearch<CR>
" Alternate buffer
nnoremap <BS> :b#<CR>
" Yank line
nnoremap Y yy
" Select all
nnoremap <Leader>a ggVG
" Join lines
nnoremap H :join<CR>
" Move line under cursor up or down
nnoremap K :m-2<CR>
nnoremap J :m+<CR>
" Move visually selected line(s) up or down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" Indent line(s) in visual mode
vnoremap > >gv
vnoremap < <gv
" Move between splits with <C-[hlkj]>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
" Resize horizontal splits
nnoremap <silent> ;+ :resize +5<CR>
nnoremap <silent> ;- :resize -5<CR>
" Resize vertical splits
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" vim-plug mappings
nnoremap <Leader>PC :PlugClean<CR>
nnoremap <Leader>PI :PlugInstall<CR>
nnoremap <Leader>PS :PlugStatus<CR>
nnoremap <Leader>PU :PlugUpdate<CR>

" Telescope mappings
nnoremap <silent> ;f :Telescope find_files<CR>
nnoremap <silent> ;g :Telescope live_grep<CR>
nnoremap <silent> ;b :Telescope buffers<CR>
nnoremap <silent> ;m :Telescope marks<CR>
nnoremap <silent> ;r :Telescope registers<CR>
nnoremap <silent> ;k :Telescope keymaps<CR>
nnoremap <silent> ;h :Telescope highlights<CR>

lua <<EOF
local actions = require "telescope.actions"

require "telescope".setup {
  defaults = {
    mappings = {
      -- insert mode
      i = { 
        -- go to file selection as a split
        ["<C-h>"] = actions.select_horizontal, 
      },
      -- normal mode
      n = { 
        -- go to file selection as a split
        ["<C-h>"] = actions.select_horizontal,
      }
    },
    layout_config = {
      -- increase the width of the preview window
      preview_width = 0.6
    }
  }
}
EOF

" Emmet
let g:user_emmet_mode = 'i'
let g:user_emmet_leader_key = '<Leader>' " ,,
let g:user_emmet_install_global = 0
autocmd FileType html,javascript EmmetInstall

" Save folds
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

" --------------- COC START ------------------"
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-css', 'coc-pairs', 'coc-snippets' ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation of symbol under cursor, also known as cursor hover
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

" Add `:Prettier`  command to format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"----------------- COC END ---------------------"
