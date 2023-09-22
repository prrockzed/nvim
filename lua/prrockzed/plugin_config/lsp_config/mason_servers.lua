local status_ok, options = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

-- list of servers for mason to install
local server = {
	-- for lua
	"lua_ls", -- (lsp)
	"stylua", -- (null-ls  formatting)

	-- for cpp
	"clangd", -- (lsp)
	"clang-format", -- (null-ls  formatting)

	-- python
	"pyright", -- (lsp)
	"mypy", -- (null-ls  diagnostics  static type checking)
	"ruff", -- (null-ls  diagnostics  linting)
	"black", -- (null-ls  formatting)

	-- typescript, javascript (with react)
	"tsserver", -- (lsp)
	"prettier", -- (null-ls  formatting) ( for html, css, scss, json, markdown, vue too)
	"eslint", -- (null-ls  diagnostics code_actions)

	-- go, gomod, gowork, gotmpl
	"gopls", -- (lsp)
	"gofumpt", -- (null-ls  formatting)
	"goimports_reviser", -- (null-ls  formatting)
	"golines", -- (null-ls  formatting(lines))
}

options.setup({
	ensure_installed = server,
	automatic_installation = true,
})
