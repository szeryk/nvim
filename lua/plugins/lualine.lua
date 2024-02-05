return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- TODO: this can be simplified with "opts"
        require("lualine").setup({
            options = {
                theme = "dracula"
            }
        })
    end
}

