# What's in this repo?
My neovim configuration that I use to develop Python and C/C++ projects.

# How to use?
1. Clone this repo into your `$HOME/.config` dir.
2. Make sure you have installed all dependencies.
3. Using :Mason to install all formatters/linters listed in `lua/plugins/none-ls.lua`
4. See and adjust `lua/vim-keymap.lua` and `lua/vim-options.lua`.
5. Enjoy :)

# List of dependencies:
- npm 8.0+
- nodejs 17.0+
- python3
- pip
- ripgrep (needed for telescope grepping)
- Nerd Fonts

# Quirks
- C++ LSP used is `clangd` which relies heavily on `compile_commands.json`. Learn about it.

# List of plugins
- Appearance:
    - color theme:       https://github.com/catppuccin/catppuccin
    - status line:       https://github.com/nvim-lualine/lualine.nvim
    - code highlighting: https://github.com/nvim-treesitter/nvim-treesitter
    - tmux navigation:   https://github.com/christoomey/vim-tmux-navigator
- Utilities:
    - plugin manager:         https://github.com/folke/lazy.nvim
    - tree-like file browser: https://github.com/nvim-neo-tree/neo-tree.nvim
    - fuzzy finder:           https://github.com/nvim-telescope/telescope.nvim
- LSP:
    - LSPs/formatters/linters package manager:            https://github.com/williamboman/mason.nvim
    - bridge for Mason and lspconfig:                     https://github.com/williamboman/mason-lspconfig.nvim
    - collection of configs for built-in Nvim LSP client: https://github.com/neovim/nvim-lspconfig
    - allowing formatters to hook into LSP client:        https://github.com/nvimtools/none-ls.nvim
- Code completion:
    - completions engine:                      https://github.com/hrsh7th/nvim-cmp
    - source for neovim's built-in LSP client: https://github.com/hrsh7th/cmp-nvim-lsp
    - snippet enigne:                          https://github.com/L3MON4D3/LuaSnip
    - LuaSnip completion source for nvim-cmp:  https://github.com/saadparwaiz1/cmp_luasnip
    - collection of snippets:                  https://github.com/rafamadriz/friendly-snippets

