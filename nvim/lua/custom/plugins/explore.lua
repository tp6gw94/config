return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      lsp_file_methods = {
        autosave_name = true,
      },
      watch_for_changes = true,
      keymaps = {
        ['<A-h>'] = { 'actions.select', opts = { horizontal = true } },
        ['<A-l'] = { 'actions.refresh' },
        ['<C-h>'] = false,
        ['<C-l>'] = false,
      },
      view_options = {
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { '<leader>o', mode = { 'n' }, '<cmd>Oil<cr>', desc = 'Open parent directory' },
      {
        '<leader>O',
        mode = { 'n' },
        function()
          require('oil').open(vim.fn.getcwd())
        end,
        desc = 'Open cwd',
      },
    },
  },
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    --@type YaziConfig | {}
    opts = {
      integrations = {
        grep_in_directory = 'snacks.picker',
        grep_in_selected_files = 'snacks.picker',
      },
    },
    dependencies = {
      'folke/snacks.nvim',
    },
    keys = {
      { '<leader>e', mode = { 'n', 'v' }, '<cmd>Yazi<cr>', desc = 'Explore current file' },
      { '<leader>E', mode = { 'n', 'v' }, '<cmd>Yazi cwd<cr>', desc = 'Explore workspace' },
    },
  },
}
