vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.g.colorscheme = 'peachpuff'

vim.keymap.set('n', '<space>td', function()
  print 'Hello World'
end, { buffer = 0 })
