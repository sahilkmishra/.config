return {
  { -- Fuzzy Finder (files, lsp, etc)
    lazy = false,
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    -- event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'xiyaowong/telescope-emoji.nvim',
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

      {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
      },
      'jsongerber/telescope-ssh-config',
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('mini.icons').setup()
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        pickers = {
          find_files = {
            theme = 'ivy',
          },
        },
        extensions = {
          fzf = {},
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },

          ['ssh-config'] = {
            client = 'oil', -- or 'netrw'
            ssh_config_path = '~/.ssh/config',
          },
          emoji = {
            action = function(emoji)
              -- argument emoji is a table.
              -- {name="", value="", cagegory="", description=""}

              -- vim.fn.setreg('*', emoji.value)
              -- print([[Press p or "*p to paste this emoji]] .. emoji.value)

              -- insert emoji when picked
              vim.api.nvim_put({ emoji.value }, 'c', false, true)
            end,
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      require('telescope').load_extension 'fzf'
      pcall(require('telescope').load_extension, 'ui-select')
      require('telescope').load_extension 'projects'

      require('telescope').load_extension 'emoji'
      require('telescope').load_extension 'ssh-config'
      require('telescope').load_extension 'manix'
      require('telescope').load_extension 'nerdy'

      vim.keymap.set({ 'n', 'v' }, '<leader>sv', '<cmd>Telescope ssh-config<CR>', { desc = '[S]earch Ser[v]er' })
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sl', function()
        builtin.live_grep {
          cwd = vim.fn.stdpath 'data',
        }
      end, { desc = '[S]earch [L]azy' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch Find existing [B]uffers' })
      vim.keymap.set('n', '<leader>sC', require('telescope.builtin').colorscheme, { desc = '[S]earch [C]olorschemes' })
      vim.keymap.set('n', '<leader>sp', require('telescope').extensions.projects.projects, { desc = '[S]earch [P]rojects' })
      vim.keymap.set('n', '<leader>s5', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[S]earch [%]Current Buffer' })

      vim.keymap.set('n', '<leader>se', '<cmd>Telescope emoji<CR>', { desc = '[S]earch [E]moji' })
      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>sl', function()
        builtin.live_grep {
          cwd = vim.fn.stdpath 'data',
        }
      end, { desc = '[S]earch [L]azy Data' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>scn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [C]onfig [N]eovim' })

      vim.keymap.set('n', '<leader>scc', function()
        builtin.find_files { cwd = (vim.fn.stdpath 'config') .. '/..' }
      end, { desc = '[S]earch [C]onfig [C]onfig Dir' })

      vim.keymap.set('n', '<leader>scN', function()
        require('telescope.builtin').find_files { cwd = '~/nixos_config/' }
      end, { desc = '[S]earch [C]onfig [N]ix' })

      vim.keymap.set('n', '<leader>sm', function()
        require('telescope.builtin').man_pages {}
      end, { desc = '[S]earch [m]an Pages' })

      vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope keywords=TODO,FIX<CR>', { desc = '[S]earch [T]odos' })

      vim.keymap.set('n', '<leader>si', '<cmd>Telescope nerdy<CR>', { desc = '[S]earch [i]cons ' })
    end,
  },
  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'Nerdy',
  },
}
