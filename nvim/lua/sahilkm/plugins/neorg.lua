return {
  {
    'nvim-neorg/neorg',
    lazy = false,
    version = '*',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.integrations.nvim-cmp'] = {},
          ['core.integrations.image'] = {},
          ['core.latex.renderer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                Blog = '~/Blog',
              },
              default_workspace = 'Blog',
            },
          },
          ['core.syntax'] = {},
          ['core.neorgcmd'] = {},
          ['core.queries.native'] = {},
          ['core.fs'] = {},
          ['core.clipboard'] = {},
          ['core.autocommands'] = {},
          ['core.highlights'] = {},
          ['core.scanner'] = {},
          ['core.ui'] = {},
          ['core.ui.calendar'] = {},
          ['core.tempus'] = {},
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
    keys = {

      { '<Leader>id', '<Plug>(neorg.tempus.insert-date)' },
    },
  },
}
