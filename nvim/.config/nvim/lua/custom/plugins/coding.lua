vim.pack.add {
  {
    src = 'https://github.com/kylechui/nvim-surround',
    version = vim.version.range '4.x', -- Use for stability; omit to use `main` branch for the latest features
  },
  'https://github.com/smjonas/inc-rename.nvim',
}

require('inc_rename').setup {}
vim.keymap.set('n', '<leader>rn', ':IncRename ')
