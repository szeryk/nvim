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
            local lspconfig = require("lspconfig")
            -- here setup all of the lsp you want to attach to
            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})

            local vimKeymap = require("..vim-keymap")
            vimKeymap.setLspKeymap()
        end
    }
}
