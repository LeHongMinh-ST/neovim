-- ~/.config/nvim/lua/plugins/php.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "php" },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)

      ---@class parser_config
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          enabled = true,
          settings = {
            filetypes = { "php", "blade" },
            settings = {
              intelephense = {
                filetypes = { "php", "blade" },
                files = {
                  associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                  maxSize = 5000000,
                },
                stubs = {
                  "laravel",
                  "eloquent",
                  "model",
                  "database",
                },
              },
            },
          },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        php = { "phpcs" },
      },
      linters = {
        phpcs = {
          args = { "--ignore=CommentingRules" },
          stdin = false,
          stream = "stdout",
          parser = require("lint.parser").from_errorformat("%E%f:%l:%c: %m"),
        },
      },
      hooks = {
        ["lint-done"] = function(result)
          if result and result.linter == "phpcs" then
            vim.notify = function() end
          end
        end,
      },
    },
  },
  {
    "jwalton512/vim-blade",
  },
  {
    -- Add neotest-pest plugin for running PHP tests.
    -- A package is also available for PHPUnit if needed.
    "nvim-neotest/neotest",
    dependencies = { "V13Axel/neotest-pest" },
    opts = { adapters = { "neotest-pest" } },
  },
  {
    "ricardoramirezr/blade-nav.nvim",
    dependencies = { -- totally optional
      "hrsh7th/nvim-cmp", -- if using nvim-cmp
      { "ms-jpq/coq_nvim", branch = "coq" }, -- if using coq
    },
    ft = { "blade", "php" }, -- optional, improves startup time
    opts = {
      close_tag_on_complete = true,
    },
  },
  {
    "ricardoramirezr/lali-components.nvim",
    ft = "blade",
  },
  {
    "kevinhwang91/promise-async",
  },
  {
    "ccaglak/larago.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
