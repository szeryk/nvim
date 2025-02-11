local vimKeymap = require("..vim-keymap")

return {
  "folke/snacks.nvim",
  dependencies = {
        'nvim-tree/nvim-web-devicons', -- requires nerd fonts in the terminal to work correctly
  },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },       -- disable treesitter for large files
    dashboard = { enabled = true },     -- starting dashboard
    indent = { enabled = false },       -- extra indent guides
    input = { enabled = true },         -- pretty input window
    notifier = {                        -- notification system, e.g. about detected config change
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },     -- load nvim cli argument file as quickly as possible (delay plugins)
    scroll = { enabled = false },       -- smooth scrolling
    statuscolumn = { enabled = false }, -- status column with git signs
    words = { enabled = true },         -- auto show LSP references
    explorer = {
        enabled = true,
        replace_netrw = false, -- a little buggy when enabled
    },
  },
  keys = vimKeymap.snacks_keys,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        vimKeymap.snacks_toggles()
      end,
    })
  end,
}
