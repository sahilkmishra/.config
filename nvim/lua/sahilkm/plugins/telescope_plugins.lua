return {
  {
    'dhruvmanila/browser-bookmarks.nvim',
    version = '*',
    -- Only required to override the default options
    opts = {
      -- Override default configuration values
      selected_browser = 'firefox',
      url_open_command = 'open',
      profile_name = 'default-release',
    },
    dependencies = {
      --   -- Only if your selected browser is Firefox, Waterfox or buku
      'kkharji/sqlite.lua',
      --
      --   -- Only if you're using the Telescope extension
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x', -- Recommended
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mrcjkb/telescope-manix',
    },
  },
  {
    'fcying/telescope-ctags-outline.nvim',
    config = function()
      require('telescope').setup {
        extensions = {
          ctags_outline = {
            --ctags option
            ctags = { 'ctags' },
            --ctags filetype option
            ft_opt = {
              vim = '--vim-kinds=fk',
              lua = '--lua-kinds=fk',
            },
            sorting_strategy = 'ascending',
          },
        },
      }

      require('telescope').load_extension 'ctags_outline'
    end,
  },
}
