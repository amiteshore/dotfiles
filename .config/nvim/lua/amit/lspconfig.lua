local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig")["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = function(client)
		if client.name == "sumneko_lua" then
			client.resolved_capabilities.document_formatting = false
		end

		local bufopts = { buffer = 0 }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

require("lspconfig")["tsserver"].setup({
	capabilities = capabilities,
	on_attach = function(client)
		-- disable formatting by tsserver
		if client.name == "tsserver" then
			client.resolved_capabilities.document_formatting = false
		end

		local bufopts = { buffer = 0 }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	end,
})

require("lspconfig")["tailwindcss"].setup({
	on_attach = function()
		vim.keymap.set("n", "Z", vim.lsp.buf.hover, { buffer = 0 })
	end,
})
