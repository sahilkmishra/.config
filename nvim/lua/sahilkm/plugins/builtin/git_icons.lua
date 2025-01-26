return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6G91/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '' },
        change = { text = '󰕚' },
        delete = { text = '' },
        topdelete = { text = '󰺝' },
        changedelete = { text = '󱂥' },
      },
    },
  },
}
