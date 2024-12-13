local M = {}

M.setup = function()
  vim.keymap.set('n', ';', '<cmd>Telescope commands<CR>', { desc = 'Search Commands' })
  -- [E]dit
  vim.keymap.set('n', '<leader>ee', '<cmd>Oil<CR>', { desc = '[E]xplore' })
  vim.keymap.set('n', '<leader>eg', '<cmd>Neogit<CR>', { desc = '[E]dit [G]it' })

  -- [S]earch

  -- [T]oggle
  vim.keymap.set('n', '<leader>tr', function()
    vim.opt.relativenumber = not vim.opt.rnu
  end, { desc = '[T]oggle [R]elative Line Numbers' })

  -- [B]uffer

  vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { desc = '[B]uffer [P]revious' })
  vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })
end

return M
