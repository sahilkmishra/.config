vim.api.nvim_create_autocmd('BufWrite', {
  pattern = '*.tex',
  callback = function()
    local filename = vim.fn.expand '%:p'
    vim.fn.jobstart('pdflatex ' .. filename, {
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          print 'pdflatex compilation successful'
        else
          print 'pdflatex compilation failed'
        end
      end,
    })
  end,
  group = vim.api.nvim_create_augroup('PDFLaTeXCompile', { clear = true }),
})
