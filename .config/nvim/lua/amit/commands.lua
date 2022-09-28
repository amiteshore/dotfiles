vim.api.nvim_create_user_command("Format", "lua vim.lsp.buf.formatting_sync()", {})
