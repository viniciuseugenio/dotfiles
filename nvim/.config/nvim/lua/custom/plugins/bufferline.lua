vim.pack.add {
  'https://github.com/akinsho/bufferline.nvim',
}

require('bufferline').setup {
  options = {
    mode = 'tabs',
  },
}

local k = vim.keymap
k.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Move to next bufferline tab' })
k.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Move to previous bufferline tab' })
