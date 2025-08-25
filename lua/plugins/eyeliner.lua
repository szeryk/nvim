-- ~/.config/nvim/lua/plugins/eyeliner.lua
return {
  'jinh0/eyeliner.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('eyeliner').setup({
      highlight_on_key = false,  -- highlights only after keypress
      dim = false                -- dims all other characters
    })

    -- Set custom highlights
    vim.api.nvim_set_hl(0, 'EyelinerPrimary', { bold = false, underline = true })
    vim.api.nvim_set_hl(0, 'EyelinerSecondary', { underline = false })
  end,
}
