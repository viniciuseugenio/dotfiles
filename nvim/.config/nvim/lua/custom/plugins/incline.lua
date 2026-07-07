vim.pack.add { 'https://github.com/b0o/incline.nvim' }
require('incline').setup {
  hide = {
    cursorline = true,
  },
  highlight = {
    groups = {
      InclineNormal = { guibg = '#785F01' },
    },
  },
  window = { margin = { vertical = 0, horizontal = 1 } },
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    if filename == '' then filename = '[No Name]' end
    if vim.bo[props.buf].modified then filename = '[+]' .. filename end
    local icon, color = require('nvim-web-devicons').get_icon_color(filename)
    return { { icon, guifg = '#000' }, { ' ' }, { filename } }
  end,
}
