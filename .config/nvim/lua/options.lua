require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.clipboard = ""

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format { bufnr = args.buf }
--   end,
-- })

-- local cmp = require "cmp"
-- cmp.event:on("menu_opened", function()
--   vim.b.copilot_suggestion_hidden = true
-- end)
--

vim.api.nvim_set_hl(
  0,
  "DiagnosticUnderlineError",
  { undercurl = true, sp = vim.api.nvim_get_hl(0, { name = "DiagnosticError" }).fg }
)
vim.api.nvim_set_hl(
  0,
  "DiagnosticUnderlineWarn",
  { undercurl = true, sp = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" }).fg }
)
vim.api.nvim_set_hl(
  0,
  "DiagnosticUnderlineInfo",
  { undercurl = true, sp = vim.api.nvim_get_hl(0, { name = "DiagnosticInfo" }).fg }
)
vim.api.nvim_set_hl(
  0,
  "DiagnosticUnderlineHint",
  { undercurl = true, sp = vim.api.nvim_get_hl(0, { name = "DiagnosticHint" }).fg }
)

o.wrap = false
o.scrolloff = 4
