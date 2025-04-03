return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    -- stylua: ignore
    keys = {
      -- Picker
      {'<leader>f', function() Snacks.picker.files() end, desc = 'Find Files'},
      {'<leader><space>', function() Snacks.picker.buffers() end, desc = 'Find Buffers'},
      {'<leader>:', function() Snacks.picker.command_history() end, desc = 'Command History'},
      {'<leader>n', function() Snacks.picker.notifications() end, desc = 'Notification History'}, 
      -- Grep
      {'<leader>/', function() Snacks.picker.grep() end, desc = 'Grep'},
      {'<leader>sb',function() Snacks.picker.lines() end, desc = 'Buffer Lines'},
      {'<leader>sB',function() Snacks.picker.grep_buffers() end, desc = 'Grep Open Buffers'},
      {'<leader>sw',function() Snacks.picker.grep_word() end, desc = 'Visual selection or word',mode = { 'n', 'x' }},
      {'<leader>sR',function() Snacks.picker.registers() end, desc = 'Registers'},
      {'<leader>s/',function() Snacks.picker.search_history() end, desc = 'Search History'},
      -- LSP
      {'gd',function() Snacks.picker.lsp_definitions() end, desc = 'Goto [D]efinition'},
      {'gD',function() Snacks.picker.lsp_declarations() end, desc = 'Goto [D]eclarations'},
      {'gr',function() Snacks.picker.lsp_references() end, desc = 'Goto [R]eferences'},
      {'gI',function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation'},
      {'gy',function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto T[y]pe Definition'},
      {'<leader>ss',function() Snacks.picker.lsp_symbols() end, desc = 'LSP Symbols'},
      {'<leader>sS',function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols'},
      -- Buffer
      {'<leader>bd',function() Snacks.bufdelete() end, desc = 'Buffer Delete'},
      {'<leader>bo',function() Snacks.bufdelete.other() end, desc = 'Buffer Delete Other'},
      {'<leader>ba',function() Snacks.bufdelete.all() end, desc = 'Buffer Delete All'},
      -- UI
      {'<leader>z',function() Snacks.zen() end, desc = 'Toggle Zen'},
      {'<leader>Z',function() Snacks.zen.zoom() end, desc = 'Toggle Zoom'},
      -- Git
      {'<leader>gg',function() Snacks.lazygit() end, desc = 'Lazygit'},
    },
  },
}
