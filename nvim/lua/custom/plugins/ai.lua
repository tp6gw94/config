return {
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'ibhagwan/fzf-lua', -- file picker
      'zbirenbaum/copilot.lua',
      'saghen/blink.cmp',
      'Kaiser-Yang/blink-cmp-avante',
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
    opts = {
      behaviour = {
        auto_suggestions = true,
        enable_cursor_planning_mode = true,
      },
      vendors = {
        groq = {
          __inherited_from = 'openai',
          api_key_name = 'GROQ_API_KEY',
          endpoint = 'https://api.groq.com/openai/v1/',
          model = 'llama-3.3-70b-versatile',
          max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
        },
      },
    },
    config = function()
      require('avante_lib').load()
      require('avante').setup()

      vim.api.nvim_set_hl(0, 'AvanteConflictCurrent', { bg = '#fcdd92', bold = true })
      vim.api.nvim_set_hl(0, 'AvanteConflictIncoming', { bg = '#f59393', bold = true })
    end,
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
