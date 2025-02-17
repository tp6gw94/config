return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", "~/.config/nvim/markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
