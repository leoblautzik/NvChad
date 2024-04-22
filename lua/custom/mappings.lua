local M = {}

M.general = {
    n = {
        -- Para usar los modos de vim correctanente
        ["<Up>"] = { "<Nop>" },
        ["<Down>"] = { "<Nop>" },
        ["<Left>"] = { "<Nop>" },
        ["<Right>"] = { "<Nop>" },
        ["<PageUp>"] = { "<Nop>" },
        ["<PageDown>"] = { "<Nop>" },
        ["<Del>"] = { "<Nop>" },
        -- vim-tmux navigator
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
        ["<leader>tt"] = {
            function()
                require("base46").toggle_transparency()
            end,
            "toggle transparency",
        },
        ["<leader>tn"] = {
            function()
                require("neotest").run.run()
            end,
            "Run the nearest test",
        },
        ["<leader>ta"] = {
            function()
                require("neotest").run.run(vim.fn.expand "%")
            end,
            "Run all tests in current file",
        },
        ["<leader>ts"] = {
            function()
                --require("neotest").output_panel.toggle()
                require("neotest").summary.toggle()
                --require("neotest").watch.toggle(vim.fn.expand "%")
            end,
            "Summary Test toggle",
        },
        ["<leader>ti"] = {
            function()
                require("neotest").output.open { enter = true }
                --require("neotest").output_panel.toggle()
            end,
            "Show test output",
        },
    },
    t = {
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    },
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dr"] = {
            "<cmd> DapContinue <CR>",
            "Start or continue the debugger",
        },
    },
}
M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line",
        },
        ["<leader>dus"] = {
            function()
                local widgets = require "dap.ui.widgets"
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open()
            end,
            "Open debugging sidebar",
        },
    },
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require("dap-go").debug_test()
            end,
            "Debug go test",
        },
        ["<leader>dgl"] = {
            function()
                require("dap-go").debug_last()
            end,
            "Debug last go test",
        },
    },
}
M.gopher = {
    plugin = true,
    n = {
        ["<leader>gsj"] = {
            "<cmd> GoTagAdd json <CR>",
            "Add json struct tags",
        },
        ["<leader>gsy"] = {
            "<cmd> GoTagAdd yaml <CR>",
            "Add yaml struct tags",
        },
    },
}

M.dap_python = {
    plugin = true,
    n = {
        ["<leader>dpr"] = {
            function()
                require("dap-python").test_method()
            end,
        },
    },
}

return M
