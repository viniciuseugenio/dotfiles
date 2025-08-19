require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true

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

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true })

o.wrap = false
o.scrolloff = 4
