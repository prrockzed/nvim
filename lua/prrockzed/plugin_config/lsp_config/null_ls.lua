local status_ok, options = pcall(require, "null-ls")
if not status_ok then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = options.builtins.formatting

options.setup({
	debug = false,
	sources = {
		-- formatting
		formatting.stylua,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
