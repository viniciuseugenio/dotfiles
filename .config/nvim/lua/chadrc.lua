-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "default-dark",
}

local ascii = require "ascii"

M.nvdash = {
  load_on_startup = true,
  header = ascii.art.text.slogons.make_cool_stuff,
  buttons = {},
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
