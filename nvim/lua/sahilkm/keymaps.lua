local M = {}

M.setup = function()
  -- Quick Fix
  vim.keymap.set('n', '<M-k>', '<cmd>cNext<CR>', { desc = 'Qui[c]k fix Next' })
  vim.keymap.set('n', '<M-j>', '<cmd>cprevious<CR>', { desc = 'Qui[c]k fix Previous' })

  vim.keymap.set('n', ';', '<cmd>Telescope commands<CR>', { desc = 'Search Commands' })

  -- [E]nter Rationale, this looks at other programs, not nvim
  vim.keymap.set('n', '<leader>ee', '<cmd>Oil<CR>', { desc = '[E]nter [E]xplore' })
  vim.keymap.set('n', '<leader>eg', '<cmd>Neogit<CR>', { desc = '[E]nter [G]it' })
  vim.keymap.set('n', '<leader>ed', '<cmd>DapNew<CR>', { desc = '[E]nter [D]ebug' })
  vim.keymap.set('n', '<leader>et', function()
    vim.cmd.vnew()
    vim.cmd.terminal()
    vim.cmd.wincmd 'J'
    vim.api.nvim_win_set_height(0, 5)
  end, { desc = '[E]nter [T]erminal' })
  vim.keymap.set('n', '<leader>eb', '<cmd>BrowserBookmarks<CR>', { desc = '[E]nter [B]ookmarks' })

  -- [S]earch
  vim.keymap.set('n', '<leader>sN', function()
    require('telescope.builtin').find_files { cwd = '~/nixos_config/' }
  end, { desc = '[S]earch [N]ix Config' })

  vim.keymap.set('n', '<leader>sm', function()
    require('telescope.builtin').man_pages {}
  end, { desc = '[S]earch [m]an Pages' })

  vim.keymap.set('n', '<leader>st', '<cmd>TodoTelescope keywords=TODO,FIX<CR>', { desc = '[S]earch [T]odos' })

  -- [T]oggle
  vim.keymap.set('n', '<leader>tr', function()
    vim.opt.relativenumber = not vim.opt.rnu
  end, { desc = '[T]oggle [R]elative Line Numbers' })

  -- [B]uffer

  vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { desc = '[B]uffer [P]revious' })
  vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })
end

return M
