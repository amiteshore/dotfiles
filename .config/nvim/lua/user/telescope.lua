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
nnoremap(";f", function()
	require("telescope.builtin").find_files({ find_command = { "fd", "--hidden", "--type", "f" } })
end)
nnoremap(";g", function()
	require("telescope.builtin").live_grep()
end)
nnoremap(";b", function()
	require("telescope.builtin").buffers()
end)
nnoremap(";m", function()
	require("telescope.builtin").marks()
end)
nnoremap(";r", function()
	require("telescope.builtin").registers()
end)
nnoremap(";k", function()
	require("telescope.builtin").keymaps()
end)
