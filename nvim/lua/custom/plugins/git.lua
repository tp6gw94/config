return {
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>gdf', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git Diff Current File' },
      { '<leader>gdb', '<cmd>DiffviewFileHistory<cr>', desc = 'Git Diff Branch' },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },
      current_line_blame = true,

      on_attach = function()
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map('n', ']h', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gs.nav_hunk 'next'
          end
        end, 'Next Hunk')
        map('n', '[h', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gs.nav_hunk 'prev'
          end
        end, 'Prev Hunk')

        map('n', '<leader>ghp', gs.preview_hunk_inline, 'Preview Hunk Inline')
        map('n', '<leader>ghb', function()
          gs.blame_line { full = true }
        end, 'Blame Line')
        map('n', '<leader>ghB', function()
          gs.blame()
        end, 'Blame Buffer')
        map('n', '<leader>ghr', gs.reset_hunk, 'Reset Hunk')
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
      end,
    },
  },
}
