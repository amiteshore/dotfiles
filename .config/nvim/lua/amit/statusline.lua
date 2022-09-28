require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "auto",
		section_separators = "",
		component_separators = "",
		-- globalstatus = true,
	},
	sections = {
		lualine_y = {},
		lualine_x = { { "filetype", colored = true } },
	},
})
