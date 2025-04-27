return {
  {
    'projekt0n/github-nvim-theme',
    enabled = false,
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd 'colorscheme github_light_high_contrast'
    end,
  },
  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    enable = true,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.zenbones_solid_line_nr = true
      vim.g.zenbones_lightness = 'bright'
      vim.cmd.colorscheme 'zenbones'
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- require('kanagawa').setup {
      --   terminal_colors = true,
      --   theme = 'dragon',
      -- }
      -- vim.cmd 'colorscheme kanagawa'
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- require('gruvbox').setup {
      --   contrast = 'hard',
      -- }
      -- vim.cmd 'colorscheme gruvbox'
    end,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd [[colorscheme tokyonight-day]]
    end,
  },
}
