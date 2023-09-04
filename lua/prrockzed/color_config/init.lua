-- colorschemes configuration goes here
require("prrockzed.color_config.onedark")
require("prrockzed.color_config.nightfox")
require("prrockzed.color_config.tokyonight")

-- list of external colorschemes
-- onedark (dark, darker, cool, deep, warm, warmer, light)
-- nightfox (nightfox, dayfox, dawnfox, duskfox, nordfox, terrafox, carbonfox)
-- tokyonight (tokyonight, tokyonight-day, tokyonight-moon, tokyonight-night, tokyonight-storm)

-- colorscheme configuration
local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return
end
