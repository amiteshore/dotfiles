-- options.lua --

-- uses "gui" :highlight attributes instead of "cterm" attributes.
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
-- vim.opt.cursorline = true

vim.opt.showmode = false
vim.opt.laststatus = 2

vim.opt.scrolloff = 8
vim.opt.history = 1000
vim.opt.updatetime = 300
vim.opt.clipboard = vim.opt.clipboard ^ "unnamed,unnamedplus"
vim.opt.shortmess = vim.opt.shortmess + "c"

-- disable auto comment in the next line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- indentation
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- map , (comma) as leader key
vim.g.mapleader = ","

-- disable newrw in favour of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- lazy.nvim / plugin management --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- plugins --

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-h>"] = require("telescope.actions").select_horizontal,
						},
						n = {
							["<C-h>"] = require("telescope.actions").select_horizontal,
						},
					},
					layout_config = {
						preview_width = 0.6,
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"html",
					"css",
					"bash",
					"markdown",
					"vim",
					"yaml",
					"lua",
					"javascript",
					"json",
					"typescript",
					"c",
					"cpp",
				},
				sync_install = false,
				highlight = {
					enable = true,
				},
				playground = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = { styles = { comments = "italic" } },
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = "auto",
					section_separators = "",
					component_separators = "",
					globalstatus = true, -- for multiple splits
				},
				sections = {
					lualine_y = {},
					lualine_x = { { "filetype", colored = true } },
				},
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = { width = 28 },
			})
		end,
	},
	"tpope/vim-commentary",
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				tsserver = {},
				lua_ls = {
					-- cmd = {...},
					-- filetypes = {...},
					-- capabilities = {...},
					-- settings = {...}
				},
			}

			-- Ensure the servers and tools above are installed
			require("mason").setup()
			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			-- Customize formatters
			-- formatters = {
			-- 	shfmt = {
			-- 		prepend_args = { "-i", "2" },
			-- 	},
			-- },
		},
	},
	-- autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				-- completion = { completeopt = "menu,menuone,noinsert" },
				completion = { completeopt = "menu,menuone,preview" },

				mapping = cmp.mapping.preset.insert({
					-- select [n]ext and [p]revious item
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- accept ([y]es) the completion (this will auto-import if your LSP supports it.)
					-- this will expand snippets if the LSP sent a snippet
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- accept currently selected item
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					-- manually trigger a completion from nvim-cmp
					["<C-Space>"] = cmp.mapping.complete({}),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
})

-- Mappings --
vim.keymap.set("n", "<leader>a", "ggVG") -- select all
vim.keymap.set("n", "<bs>", ":b#<cr>") -- alternative buffer
vim.keymap.set("n", "<leader><space>", ":nohlsearch<cr>")
vim.keymap.set("v", ">", ">gv") -- add indentation in visual mode
vim.keymap.set("v", "<", "<gv") -- remove indentation in visual mode
vim.keymap.set("n", "<leader>l", ":Lazy<cr>") -- lazy popup window
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>") -- toggle nvim-tree

-- move to split
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- I think I should change these mappings --
-- resize horizontal splits
vim.keymap.set("n", "-+", "<cmd>resize +2<cr>")
vim.keymap.set("n", "--", "<cmd>resize -2<cr>")
-- resize vertical splits
vim.keymap.set("n", "<leader>+", "<cmd>vertical resize +2<cr>")
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -2<cr>")

-- Telescope mappings
local builtin = require("telescope.builtin")

vim.keymap.set("n", ";f", function()
	builtin.find_files({ find_command = { "fd", "--hidden", "--type", "f" } })
end, {})
vim.keymap.set("n", ";g", builtin.live_grep, {})
vim.keymap.set("n", ";b", builtin.buffers, {})
vim.keymap.set("n", ";r", builtin.registers, {})
vim.keymap.set("n", ";m", builtin.marks, {})
vim.keymap.set("n", ";k", builtin.keymaps, {})

-- Colorscheme --
vim.cmd("colorscheme carbonfox")

-- LSP --
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
require("lspconfig").tsserver.setup({})
require("lspconfig").tailwindcss.setup({})

-- Autocommands --
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
	end,
})
