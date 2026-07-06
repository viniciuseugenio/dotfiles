-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal action=focus toggle=true<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    window = {
      position = 'right',
      mappings = {
        ['\\'] = 'close_window',
        ['o'] = 'open',
        ['oc'] = 'noop',
        ['od'] = 'noop',
        ['og'] = 'noop',
        ['om'] = 'noop',
        ['on'] = 'noop',
        ['os'] = 'noop',
        ['ot'] = 'noop',
      },
    },
  },
}
