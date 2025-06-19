return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "vue" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {},
      },
    },
  },
}
