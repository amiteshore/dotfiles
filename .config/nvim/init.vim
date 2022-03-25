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

  Plug 'haishanh/night-owl.vim'
  Plug 'itchyny/lightline.vim'

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
let g:lightline = { 'colorscheme': 'nightowl' }

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
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>t :tabnew<Space>
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><Space> :nohlsearch<CR>
" Yank line
nnoremap Y yy
" Select all
nnoremap <Leader>a ggVG
" Move line under cursor up or down
nnoremap K :m-2<CR>
nnoremap J :m+<CR>
" Move visually selected line(s) up or down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" Indent line(s) in visual mode
vnoremap > >gv
vnoremap < <gv
" Resize splits
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" Move between splits with <C-[hlkj]>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

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
require'telescope'.setup {
  defaults = {
    layout_config = {
      -- Increase the width of the preview window
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
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-json', 'coc-css', 'coc-pairs' ]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup coc_group
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Prettier`  command to format current buffer
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
"----------------- COC END ---------------------"
