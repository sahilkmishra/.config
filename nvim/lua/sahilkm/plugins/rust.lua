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
}
