return {
  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      { 'python', 'javascript', 'go', 'rust' },
      true,
      true,
      nil,
    },
  },
}
