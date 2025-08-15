return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      php = { "php_cs_fixer" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      python = { "ruff_format" },
    },
    formatters = {
      php_cs_fixer = {
        command = "php-cs-fixer",
        args = { "fix", "--using-cache=no", "$FILENAME" },
        stdin = false,
      },
      prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
      },
      biome = {
        command = "biome",
        stdin = true,
        args = { "format", "--stdin-file-path", "$FILENAME" },
      },
      ruff_format = {
        command = "ruff",
        args = { "format", "-" },
        stdin = true,
      },
      black = {
        command = "black",
        args = { "--quiet", "-" },
        stdin = true,
      },
      isort = {
        command = "isort",
        args = { "--quiet", "-" },
        stdin = true,
      },
    },
  },
}
