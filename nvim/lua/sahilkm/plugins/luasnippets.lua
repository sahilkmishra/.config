return {
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = {
      'rafamadriz/friendly-snippets',
      'molleweide/LuaSnip-snippets.nvim', -- required
    },
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    init = function()
      local ls = require 'luasnip'

      -- ls.snippets = require('luasnip-snippets').load_snippets()
      vim.keymap.set({ 'i' }, '<C-k>', function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-l>', function()
        ls.jump(1)
      end, { silent = true })
      vim.keymap.set({ 'i', 's' }, '<C-j>', function()
        ls.jump(-1)
      end, { silent = true })

      vim.keymap.set({ 'i', 's' }, '<C-e>', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end,
  },
  'honza/vim-snippets',
}
