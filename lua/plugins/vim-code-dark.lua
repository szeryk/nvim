-- lazy.nvim expects all files from lua/plugins to return lua table with configuration
-- all tables are merged and used by lazy.nvim to manage plugins
return {
    "tomasiser/vim-code-dark",
    priority = 1000,
    config = function() -- this is called once plugin is loaded
        -- require("vim-code-dark").setup() not needed - lazy does it by default
        vim.cmd.colorscheme("codedark")
    end,
}
