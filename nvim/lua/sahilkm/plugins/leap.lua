return {
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').create_default_mappings()

      vim.keymap.set('n', '<leader><leader>', '<Plug>(leap-forward)', { desc = 'Leap' })
      vim.keymap.set('n', '<S-leader><S-leader>', '<Plug>(leap-backward)', { desc = 'Leap' })
    end,
  },
}
