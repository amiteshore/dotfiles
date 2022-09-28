local nnoremap = require("user.keymap").nnoremap

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

-- telescope --
nnoremap("<leader>f", function()
	require("telescope.builtin").find_files()
end)
nnoremap("<leader>g", function()
	require("telescope.builtin").live_grep()
end)
nnoremap("<leader>b", function()
	require("telescope.builtin").buffers()
end)
nnoremap("<leader>m", function()
	require("telescope.builtin").marks()
end)
nnoremap("<leader>r", function()
	require("telescope.builtin").registers()
end)
nnoremap("<leader>k", function()
	require("telescope.builtin").keymaps()
end)
