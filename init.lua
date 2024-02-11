-- custom vim editor options
require("vim-options")
local vimKeymap = require("vim-keymap")
vimKeymap.setGeneralKeymap()

-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy
require("lazy").setup("plugins") -- uses all plugins modules from lua/plugins/*

-- work around for neotree - it cannot be correctly setup by lazy.vim
-- for some reason opts = {} are not passed / are not working with
-- lazy.vim's default setup(opts) call
require("neo-tree").setup({
	filesystem = {
		follow_current_file = { enabled = true },
		hijack_netrw_behavior = "disabled",
	},
	close_if_last_window = true,
})

