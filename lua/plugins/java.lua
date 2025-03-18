return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "java" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {
          enabled = true,
          settings = {
            java = {
              configuration = {
                runtimes = {
                  { name = "JavaSE-17", path = "/path/to/java17", default = false },
                  { name = "JavaSE-21", path = "/path/to/java21", default = true },
                },
              },
              codeGeneration = {
                toString = {
                  template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                hashCodeEquals = {
                  useInstanceof = true,
                },
                useBlocks = true,
              },
            },
          },
        },
      },
      setup = {
        jdtls = function(_, opts)
          return true
        end,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.google_java_format,
          null_ls.builtins.diagnostics.checkstyle,
        },
      }
    end,
  },
  {
    "nvim-java/nvim-java",
    config = function()
      require("java").setup()
      require("lspconfig").jdtls.setup({})
    end,
  },
}
