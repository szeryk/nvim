return {
    -- mason manages installed LSPs, formatters, linters etc.
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    -- mason-lspconfig makes configuring mason easier
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- watchout! pyright needs npm to be available in the system
                ensure_installed = { "lua_ls", "pyright" }
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
                capabilities = capabilities
            })

            -- if pyright is not attached - check your npm and node version and:
            -- :checkhealth mason
            lspconfig.pyright.setup({
                capabilities = capabilities
            })

            local vimKeymap = require("..vim-keymap")
            vimKeymap.setLspKeymap()
        end
    }
}
