-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_augroup('ConsoleLogMappings', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'ConsoleLogMappings',
  pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
  callback = function()
    vim.api.nvim_buf_set_keymap(
      0,
      'v',
      '<leader>cl',
      [[y:let @l=@"<CR>o<Esc>iconsole.log('[File: <C-r>=expand('%:t')<CR>, Line: <C-r>=line(".")-1<CR>] <C-r>=trim(@l)<CR>', <C-r>=trim(@l)<CR>);<Esc>]],
      { noremap = true, silent = true, desc = 'Console log selected text' }
    )
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'qf' },
  callback = function()
    vim.keymap.set('n', 'q', '<cmd>bd<cr>', { silent = true, buffer = true })
  end,
})
