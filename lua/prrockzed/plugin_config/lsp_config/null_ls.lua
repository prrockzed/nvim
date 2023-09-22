local status_ok, options = pcall(require, "null-ls")
if not status_ok then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = options.builtins.formatting
local diagnostics = options.builtins.diagnostics
local code_actions = options.builtins.code_actions

options.setup({
	debug = false,
	sources = {
		-- the file type is given in mason_servers.lua file under mason plugin

		-- formatting
		formatting.stylua,
		formatting.clang_format,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.prettier.with({ extra_args = { "--no-semi" } }),

		-- diagnostics
		diagnostics.mypy,
		diagnostics.ruff,
		diagnostics.eslint,

		-- code_actions
		code_actions.eslint,
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
