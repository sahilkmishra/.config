return {
  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
    dependencies = {
      'nvim-telescope/telescope.nvim',
      -- "ibhagwan/fzf-lua",
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      -- configuration goes here
      lang = 'golang',
      storage = {
        home = vim.fn.stdpath 'data' .. '/leetcode',
        cache = vim.fn.stdpath 'cache' .. '/leetcode',
      },
      image_support = true,
    },
    keys = {
      {
        '<leader>eL',
        '<cmd>Leet<cr>',
        desc = '[E]nter [L]eet',
      },
      {
        '<leader>LL',
        '<cmd>Leet lang<cr>',
        desc = '[L]eet [L]ang',
      },

      {
        '<leader>Ls',
        '<cmd>Leet submit<cr>',
        desc = '[L]eet [s]ubmit',
      },
      {
        '<leader>Lr',
        '<cmd>Leet run<cr>',
        desc = '[L]eet [r]un',
      },
    },
    hooks = {
      ['question_enter'] = {
        function()
          local file_extension = vim.fn.expand '%:e'
          if file_extension == 'rs' then
            local target_dir = vim.fn.stdpath 'data' .. '/leetcode'
            local output_file = target_dir .. '/rust-project.json'

            if vim.fn.isdirectory(target_dir) == 1 then
              local crates = ''
              local next = ''

              local rs_files = vim.fn.globpath(target_dir, '*.rs', false, true)
              for _, f in ipairs(rs_files) do
                local file_path = f
                crates = crates .. next .. '{"root_module": "' .. file_path .. '","edition": "2021","deps": []}'
                next = ','
              end

              if crates == '' then
                print('No .rs files found in directory: ' .. target_dir)
                return
              end

              local sysroot_src = vim.fn.system('rustc --print sysroot'):gsub('\n', '') .. '/lib/rustlib/src/rust/library'

              local json_content = '{"sysroot_src": "' .. sysroot_src .. '", "crates": [' .. crates .. ']}'

              local file = io.open(output_file, 'w')
              if file then
                file:write(json_content)
                file:close()

                local clients = vim.lsp.get_clients()
                local rust_analyzer_attached = false
                for _, client in ipairs(clients) do
                  if client.name == 'rust_analyzer' then
                    rust_analyzer_attached = true
                    break
                  end
                end

                if rust_analyzer_attached then
                  vim.cmd 'LspRestart rust_analyzer'
                end
              else
                print('Failed to open file: ' .. output_file)
              end
            else
              print('Directory ' .. target_dir .. ' does not exist.')
            end
          end
        end,
      },
    },
  },
}
