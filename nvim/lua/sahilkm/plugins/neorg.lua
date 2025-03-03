return {
  {
    'nvim-neorg/neorg',
    dependencies = {
      {
        'juniorsundar/neorg-extras',
        -- tag = "*" -- Always a safe bet to track current latest release
      },
      -- FOR Neorg-Roam Features
      --- OPTION 1: Telescope
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      -- OR OPTION 2: Fzf-Lua
      -- 'ibhagwan/fzf-lua',
      -- OR OPTION 3: Snacks
      -- 'folke/snacks.nvim',
    },

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
          ['external.many-mans'] = {
            config = {
              metadata_fold = true, -- If want @data property ... @end to fold
              code_fold = true, -- If want @code ... @end to fold
            },
          },
          -- OPTIONAL
          ['external.agenda'] = {
            config = {
              workspace = 'Blog', -- or set to "tasks_workspace" to limit agenda search to just that workspace
            },
          },
          ['external.roam'] = {
            config = {
              fuzzy_finder = 'Telescope', -- OR "Fzf" OR "Snacks". Defaults to "Telescope"
              fuzzy_backlinks = false, -- Set to "true" for backlinks in fuzzy finder instead of buffer
              roam_base_directory = '', -- Directory in current workspace to store roam nodes
              node_name_randomiser = false, -- Tokenise node name suffix for more randomisation
              node_name_snake_case = false, -- snake_case the names if node_name_randomiser = false
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2

      require('neorg.core').modules.get_module('core.dirman').set_workspace 'Blog'
    end,
    keys = {

      { '<Leader>id', '<Plug>(neorg.tempus.insert-date)' },
      { '<Leader>ct', ':Neorg roam capture selection<CR>', mode = 'v', desc = '[C]apture [T]odo' },
      { '<Leader>ena', ':Neorg agenda day<CR>', desc = '[E]nter [N]org [A]genda' },
      { '<Leader>mm', ':Neorg cycle_task<CR>', desc = '[M]ark [M]' },
    },
  },
}
