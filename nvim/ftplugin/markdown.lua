-- Add the key mappings only for Markdown files in a zk notebook.
if require('zk.util').notebook_root(vim.fn.expand '%:p') ~= nil then
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { desc = desc })
  end

  -- Open the link under the caret.
  map('<CR>', '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Open the link under the caret')

  map('<leader>znt', ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", 'Create new note from title selection', 'v')
  map(
    '<leader>znc',
    ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
    'Create new note from content selection',
    'v'
  )

  -- Open notes linking to the current buffer.
  map('<leader>zb', '<Cmd>ZkBacklinks<CR>', 'Show backlinks')
  -- Alternative for backlinks using pure LSP and showing the source context.
  --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- Open notes linked by the current buffer.
  map('<leader>zl', '<Cmd>ZkLinks<CR>', 'Show links')

  -- Preview a linked note.
  -- map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- Open the code actions for a visual selection.
  map('<leader>za', ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", 'Show code actions', 'v')
end
