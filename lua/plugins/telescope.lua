return { 
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local vimKeymap = require("..vim-keymap")
        vimKeymap.setTelescopeKeymap()
    end
}
