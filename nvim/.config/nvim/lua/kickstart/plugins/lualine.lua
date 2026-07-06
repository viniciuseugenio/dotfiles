-- Checks if a macro is being recorded
local function macro_recording()
  local reg = vim.fn.reg_recording()
  if reg == '' then return '' end
  return 'Recording @' .. reg
end

-- Refresh lualine when macro recording starts
vim.api.nvim_create_autocmd('RecordingEnter', {
  callback = function() require('lualine').refresh { place = { 'statusline' } } end,
})

-- Refresh lualine when macro recording stops
vim.api.nvim_create_autocmd('RecordingLeave', {
  callback = function()
    local timer = vim.uv.new_timer()
    timer:start(50, 0, vim.schedule_wrap(function() require('lualine').refresh { place = { 'statusline' } } end))
  end,
})

vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
}
require('lualine').setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    theme = 'gruvbox-material',
  },
  sections = {
    lualine_b = { 'branch', 'diagnostics' },
    lualine_x = { 'diff', 'fileformat', 'filetype' },
    lualine_y = {},
    lualine_z = { macro_recording },
  },
}
