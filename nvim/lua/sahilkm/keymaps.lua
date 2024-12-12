local M = {}

M.setup = function()
  vim.keymap.set('n', ';', '<cmd>Telescope commands<CR>', { desc = 'Search Commands' })
  vim.keymap.set('n', '<leader>ee', '<cmd>Oil<CR>', { desc = '[E]xplore' })

  -- [S]earch
  vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = '[S]earch [C]olorschemes' })

  -- [T]oggle
  vim.keymap.set('n', '<leader>tr', function()
    vim.opt.relativenumber = not vim.opt.relativenumber
  end, { desc = '[T]oggle [R]elative Line Numbers' })
end

return M
