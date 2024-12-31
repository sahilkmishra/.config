return {
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
    config = function()
      require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
      vim.keymap.set('n', '<leader><leader>', '<cmd>HopWord<CR>', { desc = 'Hop Word' })
      vim.keymap.set('v', '<leader><leader>', '<cmd>HopWord<CR>', { desc = 'Hop Word' })
      --vim.keymap.set('n', '<S-leader><S-leader>', '<Plug>(leap-backward)', { desc = 'Leap' })
    end,
  },
}
