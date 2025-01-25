return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      separator_style = "thin",
      show_buffer_close_icons = false,
    },
  },
  keys = {
    { "[b", false },
    { "]b", false },
    { "<S-l>", "<cmd>BufferLineCycleNext<CR>" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<CR>" },
  },
}
