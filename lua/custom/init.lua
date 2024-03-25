local opt = vim.opt
--vim.opt.scrolloff = 999
--vim.opt.virtualedit = "block"
--vim.opt.cursorline = true
opt.relativenumber = true
-- Undoes NvChad's effect of clearing CursorLine
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   pattern = { "*" },
--   command = "highlight link CursorLine CursorColumn",
-- })

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.undodir = os.getenv "HOME" .. "/.cache/nvim/undodir"

-- Relativo en modo Normal ---------------------------------------
-- Absoluto en modo Insert
local vim = vim
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- automatic number toggle
local number_toggle = augroup("numbertoggle", { clear = true })

autocmd({ "InsertLeave" }, {
    pattern = "*",
    group = number_toggle,
    command = "setlocal relativenumber",
})

autocmd({ "InsertEnter" }, {
    pattern = "*",
    group = number_toggle,
    command = "setlocal norelativenumber",
})
------------------------------------------------------------------

local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds { group = lastplace }
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
