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
        args = { "format", "--stdin-file-path", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
