vim.opt.scrolloff = 999
vim.opt.virtualedit = "block"
vim.opt.cursorline = true
vim.opt.relativenumber = true
-- Undoes NvChad's effect of clearing CursorLine
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   pattern = { "*" },
--   command = "highlight link CursorLine CursorColumn",
-- })
vim.opt.undodir = os.getenv "HOME" .. "/.cache/nvim/undodir"
