return {
    -- mason manages installed LSPs, formatters, linters etc.
    {
        "williamboman/mason.nvim",
    },

    -- mason-lspconfig makes configuring mason easier
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                -- watchout! pyright needs npm to be available in the system
                ensure_installed = { "lua_ls", "pyright", "clangd", "marksman" }
            })
        end
    },

    -- nvim-lspconfig makes nvim actually attach to the LSPs
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- capabilities are part of completions configuration - 
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            -- here setup all of the lsp you want to attach to
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` and Snacks global
                            globals = {
                                'vim',
                                'require',
                                'Snacks',
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },

            })

            -- if pyright is not attached - check your npm and node version and:
            -- :checkhealth mason
            lspconfig.pyright.setup({
                capabilities = capabilities
            })

            lspconfig.clangd.setup({
                capabilities = capabilities
            })

            lspconfig.marksman.setup({
                capabilities = capabilities
            })

            local vimKeymap = require("..vim-keymap")
            vimKeymap.setLspKeymap()
        end
    }
}
