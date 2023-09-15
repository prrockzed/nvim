-- Setup nvim-cmp.
local status_ok, options = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

options.setup {
  disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
  fast_wrap = {},
}

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
