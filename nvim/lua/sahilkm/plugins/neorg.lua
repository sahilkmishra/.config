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
      'nvim-neorg/neorg-telescope',
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
          ['core.qol.toc'] = {
            auto_toc = {
              enter = true,
              open = true,
            },
          },
          ['core.esupports.hop'] = {},
          ['core.qol.todo_items'] = {
            create_todo_items = true,
            create_todo_parents = true,
            -- order = ['undone', 'ambiguous', 'done', 'pending'],
          },
          ['core.todo-introspector'] = {
            highlights_group = 'DiffAdd',
          },
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.export.markdown'] = {},
          ['core.integrations.nvim-cmp'] = {},
          ['core.integrations.image'] = {},
          ['core.integrations.telescope'] = {},
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
          ['core.summary'] = { strategy = 'default' },
          ['core.esupports.metagen'] = {},
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
              fuzzy_backlinks = true, -- Set to "true" for backlinks in fuzzy finder instead of buffer
              roam_base_directory = '.roam', -- Directory in current workspace to store roam nodes
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

      { '<Leader>en', ':Neorg<CR>', desc = '[E]nter [N]eorg' },
      { '<Leader>id', '<Plug>(neorg.tempus.insert-date)', desc = '[i]nsert [d]ate' },
      { '<Leader>ct', ':Neorg roam capture selection<CR>', mode = 'v', desc = '[C]apture [T]odo' },
      { '<Leader>ej', ':Neorg journal today<CR>', desc = '[E]nter [J]ournal' },
      { '<Leader>ea', ':Neorg agenda day<CR>', desc = '[E]nter [A]genda' },
      { '<Leader>mm', ':Neorg cycle_task<CR>', desc = '[M]ark [M]' },
    },
  },
}
