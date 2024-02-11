return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended; Need to configure nerd font for your terminal
		"MunifTanjim/nui.nvim",
	},
	--[[For some reason opts are not working. Need to call setup(opts) manualy in main init.lua
	opts = {
		filesystem = {
			follow_current_file = { enabled = true },
			hijack_netrw_behavior = "disabled",
		},
		close_if_last_window = true,
	},
    --]]
	config = function()
		local vimKeymap = require("..vim-keymap")
		vimKeymap.setNeotreeKeymap()
	end,
}
