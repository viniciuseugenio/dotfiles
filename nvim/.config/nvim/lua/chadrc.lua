-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "kanagawa-dragon",
}

local ascii = require "ascii"

M.nvdash = {
  load_on_startup = true,
  header = ascii.art.text.slogons.make_cool_stuff,
  buttons = {
    { txt = " ", no_gap = false },
    -- { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Load Session", keys = "qs", cmd = ":lua require('persistence').load()" },
    -- { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.ui = {
  telescope = { style = "bordered" },
  tabufline = {
    enabled = false,
  },
}

M.term = {
  base46_colors = false,
  float = {
    height = 0.88,
    row = 0.04,
    width = 0.9,
    col = 0.05,
  },
}

return M
