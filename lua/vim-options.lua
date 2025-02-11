-- tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set smartindent")

-- line number
vim.opt.nu = true
vim.opt.relativenumber = true

-- no wrapping
vim.opt.wrap = false

-- no backups
vim.opt.swapfile = false

-- better search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- good colors
vim.opt.termguicolors = true

-- see more lines ahead
vim.opt.scrolloff = 8

-- column at the right
vim.opt.colorcolumn = "120"

-- disable default statuscolumn
vim.o.statuscolumn = ""

-- always split to the right
vim.opt.splitright = true
