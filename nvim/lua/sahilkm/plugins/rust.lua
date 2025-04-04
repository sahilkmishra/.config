return {
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { 'BufRead Cargo.toml' },
    config = function()
      -- Lazy load add crates to cmp
      require('crates').setup { completion = { cmp = { enabled = true } } }
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'rayliwell/tree-sitter-rstml',
    dependencies = { 'nvim-treesitter' },
    build = ':TSUpdate',
    config = function()
      require('tree-sitter-rstml').setup()
    end,
  },
}
