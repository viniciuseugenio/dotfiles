-- File: ~/.config/nvim/lua/custom/init.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text" },
  callback = function()
    vim.b.disable_autoformat = false
  end,
})
