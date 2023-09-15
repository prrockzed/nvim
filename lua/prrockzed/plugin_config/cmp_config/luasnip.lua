local status_ok, options = pcall(require, "luasnip")
if not status_ok then
	return
end

-- for custom snippets stored in the snippets directory under prrockzed
require("prrockzed.snippets")

-- vscode format
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })

-- snipmate format
require("luasnip.loaders.from_snipmate").load()
require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })

-- lua format
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		if
			require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
			and not require("luasnip").session.jump_active
		then
			require("luasnip").unlink_current()
		end
	end,
})

options.config.set_config({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
})

-- luasnip custom keymappings
-- declaring variables
local set = vim.keymap.set
local mode = { "i", "s" }
local sil = { silent = true }

-- key maps
set(mode, "<C-i>", function()
	if options.expand() then
		options.expand()
	end
end, sil)

set(mode, "<C-n>", function()
	if options.jumpable(1) then
		options.jump(1)
	end
end, sil)

set(mode, "<C-p>", function()
	if options.jumpable(-1) then
		options.jump(-1)
	end
end, sil)
