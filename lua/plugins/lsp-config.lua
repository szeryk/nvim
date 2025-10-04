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
            vim.lsp.config(
                "*",
                {
                    capabilities = capabilities,
                }
            )

            vim.lsp.enable({
                "lua_ls",
                "pyright",
                "clangd",
                "marksman",
                "copilot",
            })

            local vimKeymap = require("..vim-keymap")
            vimKeymap.setLspKeymap()
        end
    }
}
