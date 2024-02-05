return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local vimKeymap = require("..vim-keymap")
            vimKeymap.setTelescopeKeymap()
        end
    },
    {
        -- this is an extenstion to telescope for nice ui-select window
        -- visible e.g. when choosing code action
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = { require("telescope.themes").get_dropdown { } }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
}
