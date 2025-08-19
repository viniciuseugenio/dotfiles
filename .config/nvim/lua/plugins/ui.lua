local colors = dofile(vim.g.base46_cache .. "colors")

return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        smart_indent_cap = false,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    ensure_installed = {
      "css",
      "htmldjango",
      "html",
      "javascript",
      "jinja",
      "jsdoc",
      "json",
      "lua",
      "python",
      "typescript",
      "tsx",
    },
    opts = {
      textobjects = {
        select = {
          enabled = true,
          lookahead = true,

          keymaps = {
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    lazy = false,
    opts = {
      symbol = "│",
      options = { try_as_border = false },
    },
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  { "MunifTanjim/nui.nvim", lazy = false },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          enabled = false,
        },
      },
      presets = {
        lsp_doc_border = true,
        inc_rename = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "slide",
    },
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      highlights = {
        fill = {
          bg = colors.darker_black,
        },
        background = {
          fg = colors.light_grey,
          bg = colors.black2,
        },
        buffer_selected = {
          fg = colors.white,
          bg = colors.black,
          bold = true,
        },
        separator = {
          fg = colors.black2,
          bg = colors.black2,
        },
        separator_selected = {
          fg = colors.black,
          bg = colors.black,
        },
      },
      options = {
        mode = "tabs",
        modified_icon = "●",
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_duplicate_prefix = false,
      },
    },
  },
}
