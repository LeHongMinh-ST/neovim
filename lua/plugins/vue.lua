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
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,
        },
      }
    end,
  },
}
