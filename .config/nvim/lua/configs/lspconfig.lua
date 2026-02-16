local lspconfig = vim.lsp.config
local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults()

local servers = {
  html = {},
  cssls = {},
  vtsls = {},
  ruff = {},
  eslint = {},
  tailwindcss = {},
  basedpyright = {},
  dockerls = {},
  jsonls = {},
  jdtls = {},
  text = {},
  emmet_ls = {
    filetypes = {
      "html",
      "css",
      "scss",
      "javascriptreact",
      "typescriptreact",
    },
    init_options = {
      html = {
        options = {
          ["bem.enabled"] = true,
        },
      },
    },
  },
}

for name, custom_opts in pairs(servers) do
  local opts = vim.tbl_deep_extend("force", {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilites = nvlsp.capabilites,
  }, custom_opts)

  lspconfig(name, opts)
  vim.lsp.enable(name)
end
