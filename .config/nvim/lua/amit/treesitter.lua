require("nvim-treesitter.configs").setup({
	ensure_installed = { "html", "css", "bash", "markdown", "vim", "yaml", "lua", "javascript", "json", "typescript" },
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
