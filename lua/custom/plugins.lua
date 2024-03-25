local plugins = {

    {
        --"williamboman/mason.nvim",
        --config = function()
        --    require("mason").setup()
        --end,
        -- opts = {
        --   ensure_installed = {
        --     "lua_ls",
        --     "clangd",
        --     "clang-format",
        --     "codelldb",
        --     "stylua",
        --     "gopls",
        --     "pyright",
        --     "mypy",
        --     "ruff",
        --     "black",
        --     "rust-analyzer",
        --   },
        -- },
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "clang-format",
                    "codelldb",
                    "stylua",
                    "gopls",
                    "pyright",
                    "mypy",
                    "ruff",
                    "black",
                    "rust-analyzer",
                },
            }
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },

    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },

    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
        },
    },

    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require("core.utils").load_mappings "dap"
        end,
    },

    {
        "dreamsofcode-io/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings "dap_go"
        end,
    },

    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function(_, _)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings "dap_python"
        end,
    },

    {
        --"jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        ft = { "python", "go", "c", "cpp" },
        opts = function()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "ckipp01/stylua-nvim",
    },

    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },

    {
        "mfussenegger/nvim-jdtls",
        config = function()
            require "custom.configs.java"
        end,
    },

    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings "gopher"
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },

    {
        "tpope/vim-fugitive",
        event = "VeryLazy",
        dependencies = {
            "tpope/vim-rhubarb",
            "tpope/vim-obsession",
            "tpope/vim-unimpaired",
        },
    },

    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                signature = {
                    enabled = false,
                },
                hover = {
                    enabled = false,
                },
            }, -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            {
                "rcarriga/nvim-notify",
                config = function()
                    require("notify").setup {
                        background_colour = "#000000",
                    }
                    vim.notify = require "notify"
                end,
            },
        },
    },
}
return plugins
