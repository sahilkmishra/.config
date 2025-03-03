return {
  --[[ {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
    keys = {
      {
        '<leader>ls',
        '<cmd>SessionSave<cr>',
        desc = 'Save Session',
      },
      { '<leader>sl', '<cmd>SessionSearch<cr>', desc = '[S]earch [L]oads' },
      { '<leader>ll', '<cmd>SessionSearch<cr>', desc = '[L]oad [L]oads' },
    },
  }, ]]
}
