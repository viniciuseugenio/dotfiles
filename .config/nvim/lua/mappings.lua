require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Basic/Utility mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Copy current line, comment it and paste
map("n", "ycc", "yygccp", { remap = true })

-- Moving Lines
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })

map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })

-- Files & buffer navigation
map("n", "<leader><leader>", "<cmd> Telescope find_files <cr>", { desc = "Find files" })
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
map("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
map("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
map("n", "<leader>b", "<Cmd>tabnew<CR>", { desc = "New Tab" })
map("n", "<leader>x", "<Cmd>tabclose<CR>", { desc = "Close Tab" })

-- LSP mappings
map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
map("n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "List Code Actions" })
map("n", "<leader>co", function()
  vim.lsp.buf.code_action {
    context = { only = { "source.organizeImports" } },
    apply = true,
  }
end, { desc = "Organize Imports" })

map("n", "<leader>rnm", function()
  return ":IncRename " .. vim.fn.expand "<cword>"
end, { expr = true })

-- Git Integrations
map("n", "<leader>gb", function()
  require("gitsigns").blame_line { full = true }
end, { desc = "Git blame current line" })

map({ "n", "t" }, "<A-g>", function()
  require("nvchad.term").toggle { pos = "float", id = "lazygit", cmd = "lazygit" }
end, { desc = "Open lazygit" })

-- Plugin-specific
map("n", "<C-t>", function()
  require("nvchad.themes").open { style = "compact" }
end, {})

map("n", "<leader>cn", function()
  require("noice").cmd "dismiss"
end, { desc = "Dismiss all notifications" })

map("n", "<S-l>", "<Cmd>Lazy sync<CR>", { desc = "Open lazyvim panel" })

map("n", "<leader>qs", function()
  require("persistence").load()
end)
