---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  transparency = true,
  telescope = {
    style = "bordered",
  }, -- borderless / bordered
  statusline = {
    separator_style = "default",
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
