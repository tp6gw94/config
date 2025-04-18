return {
  {
    'projekt0n/github-nvim-theme',
    enabled = false,
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd 'colorscheme github_light_high_contrast'
    end,
  },
  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      vim.opt.background = 'light'
      vim.opt.termguicolors = true
      vim.cmd.colorscheme 'zenbones'
    end,
  },
}
