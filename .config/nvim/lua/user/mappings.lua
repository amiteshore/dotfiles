local nnoremap = require("user.keymap").nnoremap
local vnoremap = require("user.keymap").vnoremap

-- perform `PackerUpdate` and then `PackerComplie`
nnoremap("<leader>ps", "<cmd>PackerSync<cr>")

-- alternative buffer
nnoremap("<bs>", "<cmd>b#<cr>")

-- select all
nnoremap("<leader>a", "ggVG")

-- clear highlights
nnoremap("<leader><space>", "<cmd>nohlsearch<cr>")

-- move between splits
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-j>", "<C-w>j")

-- resize horizontal splits
nnoremap("-+", "<cmd>resize +2<cr>", { silent = true })
nnoremap("--", "<cmd>resize -2<cr>", { silent = true })

-- resize vertical splits
nnoremap("<leader>+", "<cmd>vertical resize +2<cr>", { silent = true })
nnoremap("<leader>-", "<cmd>vertical resize -2<cr>", { silent = true })

-- move line up or down (how about <leader>j and <leader>k)
nnoremap("K", "<cmd>move-2<cr>", { silent = true }) -- up
nnoremap("J", "<cmd>move+<cr>", { silent = true }) -- down

-- move visually selected line(s) up or down (how about <leader>j and <leader>k)
vnoremap("K", ":move '<-2<cr>gv=gv", { silent = true }) -- up
vnoremap("J", ":move '>+1<cr>gv=gv", { silent = true }) -- down

-- indent line(s) in visual mode
vnoremap(">", ">gv")
vnoremap("<", "<gv")
