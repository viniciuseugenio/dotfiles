vim.pack.add { 'https://github.com/lukas-reineke/indent-blankline.nvim', 'https://github.com/nvim-mini/mini.indentscope' }
require('ibl').setup {
  scope = {
    show_end = false,
    show_start = false,
  },
  indent = {
    smart_indent_cap = false,
    char = '│',
  },
}

require('mini.indentscope').setup {
  symbol = '│',
  options = {
    border = 'both',
    try_as_border = false,
  },
}
