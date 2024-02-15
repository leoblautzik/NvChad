---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "rosepine",
  transparency = false,
  telescope = {
    style = "bordered",
  }, -- borderless / bordered
  statusline = {
    theme = "vscode_colored",
    --separator_style = "default",
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
