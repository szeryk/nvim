-- lazy.nvim expects all files from lua/plugins to return lua table with configuration
-- all tables are merged and used by lazy.nvim to manage plugins
return { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() -- this is called once plugin is loaded
        -- require("catppuccin").setup() not needed - lazy does it by default
        vim.cmd.colorscheme("catppuccin")
    end
}
