-- local table for the functions
local K = {}

function K.setGeneralKeymap()
    -- my leader is SPACE
    vim.g.mapleader = " "
end

function K.setNeotreeKeymap()
    vim.keymap.set("n", "<leader>tt", ":Neotree filesystem reveal left<CR>")
end

function K.setTelescopeKeymap()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
end

return K
