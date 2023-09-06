-- colorschemes configuration goes here
require("prrockzed.color_config.onedark")
require("prrockzed.color_config.nightfox")
require("prrockzed.color_config.tokyonight")
require("prrockzed.color_config.catppuccin")
require("prrockzed.color_config.kanagawa")
require("prrockzed.color_config.gruvbox")

-- list of external colorschemes
-- onedark (dark, darker, cool, deep, warm, warmer, light)
-- nightfox (nightfox, dayfox, dawnfox, duskfox, nordfox, terrafox, carbonfox)
-- tokyonight (tokyonight, tokyonight-day, tokyonight-moon, tokyonight-night, tokyonight-storm)
-- doom-one(imported from emacs)
-- catppuccin (catppuccin, catppuccin-frappe, catppuccin-latte, catppuccin-mocha, catppuccin-macchiato)
-- kanagawa (kanagawa, kanagawa-dragon, kanagawa-lotus, kanagawa-wave)
-- gruvbox

-- colorscheme configuration
local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return
end
