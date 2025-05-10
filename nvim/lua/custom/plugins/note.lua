local is_neovide = vim.g.neovide or false

return {
  {
    '3rd/image.nvim',
    enabled = is_neovide == false,
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      backend = 'kitty',
      processor = 'magick_cli',
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = 'inline',
        },
      },
    },
  },
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard', ft = { 'markdown', 'tex', 'typst', 'rst', 'org' } },
    },
  },
  {
    'zk-org/zk-nvim',
    config = function()
      require('zk').setup {
        picker = 'snacks_picker',
      }
    end,
  },
}
