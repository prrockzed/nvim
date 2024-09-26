local status_ok, options = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

-- list of servers for mason to install
local server = {
	-- vim
	-- "vimls",

	-- for lua
	-- "lua_ls", -- (lsp)
	-- "stylua", -- (null-ls  formatting)

	-- for cpp
	-- "clangd", -- (lsp)
	-- "clang-format", -- (null-ls  formatting) Manually Installed

	-- python
	-- "pyright", -- (lsp)
	-- "mypy", -- (null-ls  diagnostics  static type checking) Manually Installed
	-- "ruff", -- (null-ls  diagnostics  linting) Manually Installed
	-- "black", -- (null-ls  formatting) Manually Installed

	-- typescript, javascript (with react)
	-- "tsserver", -- (lsp)
	-- "prettier", -- (null-ls  formatting) ( for html, css, scss, json, markdown, vue too) Manually Installed
	-- "eslint", -- (null-ls  diagnostics code_actions)

	-- go, gomod, gowork, gotmpl
	-- "gopls", -- (lsp)
	-- "gofumpt", -- (null-ls  formatting) Manually Installed
	-- "goimports_reviser", -- (null-ls  formatting) Manually Installed
	-- "golines", -- (null-ls  formatting(lines)) Manually Installed

	-- rust
	-- "rust_analyzer", -- (lsp)
	-- "rust.vim"  (plugin for autoformatting) Manually Installed

	-- latex
	-- "texlab",
	-- "latexindent", Manually Installed
}

options.setup({
	ensure_installed = server,
	automatic_installation = true,
})
