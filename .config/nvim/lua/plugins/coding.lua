-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  },
  {
    "laytan/tailwind-sorter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm ci && npm run build",
    config = true,
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "vtsls",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "eslint",
        "prettier",
        "black",
        "djlint",
      },
    },
    lazy = false,
  },
  { "williamboman/mason-lspconfig.nvim", lazy = false },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
      per_filetype = {
        ["html"] = {
          enable_close = false,
        },
        ["tsx"] = { enable_close = false },
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    lazy = false,
  },
  {
    "kana/vim-textobj-user",
    lazy = false,
    dependencies = {
      "beloglazov/vim-textobj-quotes",
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
      },
    },
  },
  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
}
