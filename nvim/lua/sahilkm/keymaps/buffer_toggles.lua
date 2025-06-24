M = {}
M.setup = function()
  vim.keymap.set('n', '<leader>uv', function()
    vim.o.ve = vim.o.ve == '' and 'all' or ''
  end, { desc = '[U]nset [V]irtual edit' })
end

return M
