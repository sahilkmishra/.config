M = {}
M.setup = function()
  vim.keymap.set('n', '<leader>et', function()
    vim.cmd.vnew()
    vim.cmd.terminal()
    vim.cmd.wincmd 'J'
    vim.api.nvim_win_set_height(0, 5)
  end, { desc = '[E]nter [T]erminal' })

  -- I think i may be reinventing fire with this one, just a terminal is fine
  vim.keymap.set('n', '<leader>eT', function()
    Snacks.input({ prompt = 'What command to run:', completion = 'shellcmd', input = { win = { b = { completion = true } } } }, function(value)
      vim.cmd.new()
      vim.cmd.terminal('mprocs ' .. value .. '')
      vim.api.nvim_win_set_height(0, 15)
      vim.cmd.wincmd 'a'
    end)
  end, { desc = '[E]nter [T]erminal MProcs' })
end

return M
