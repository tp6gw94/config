return {
  {
    'olimorris/codecompanion.nvim',
    opts = {
      display = {
        action_palette = {
          provider = 'default',
        },
      },
      strategies = {
        chat = {
          adapter = 'anthropic',
        },
        inline = {
          adapter = 'copilot',
        },
        cmd = {
          adapter = 'openai',
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/mcphub.nvim',
      {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown', 'codecompanion' },
      },
      {
        'echasnovski/mini.diff',
        config = function()
          local diff = require 'mini.diff'
          diff.setup {
            -- Disabled by default
            source = diff.gen_source.none(),
          }
        end,
      },
      {
        'HakonHarnes/img-clip.nvim',
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = '[Image]($FILE_PATH)',
              use_absolute_path = true,
            },
          },
        },
      },
    },
    keys = {
      { '<leader>aa', mode = { 'n', 'v' }, '<cmd>:CodeCompanionActions<cr>', desc = 'AI Code Action' },
    },
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
