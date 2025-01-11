return {
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      -- Lazy load add crates to cmp
      local cmp = require 'cmp'
      vim.api.nvim_create_autocmd('BufRead', {
        group = vim.api.nvim_create_augroup('CmpSourceCargo', { clear = true }),
        pattern = 'Cargo.toml',
        callback = function()
          cmp.setup.buffer { sources = { { name = 'crates' } } }

          require('crates.completion.cmp').setup()
        end,
      })
      require('crates').setup {
        src = {
          completion = {
            cmp = {
              enabled = true,
            },
          },
        },
      }
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
