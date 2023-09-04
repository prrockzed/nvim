local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- dump your plugins here
local plugins = {
	-- which-key plugin
	{
		"folke/which-key.nvim",
		{ "folke/neoconf.nvim", cmd = "Neoconf" },
		"folke/neodev.nvim",
	},

	-- colorscheme plugins
	{
		"navarasu/onedark.nvim",
	},
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"folke/tokyonight.nvim",
	},

	-- nvim tree (a file explorer)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	-- status line at the bottom
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- tabline/bufferline at the top
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
}

require("lazy").setup(plugins)
