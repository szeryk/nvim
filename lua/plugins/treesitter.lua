return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- Install parsers
        require("nvim-treesitter").install({"lua", "python", "c", "cpp", "xml", "markdown"})

        -- Enable treesitter highlighting for filetypes with parsers
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end
}
