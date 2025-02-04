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
              },
            },
          },
        },
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          null_ls.builtins.formatting.pint,
          null_ls.builtins.formatting.blade_formatter,
        },
      }
    end,
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
          -- Tắt thông báo từ phpcs bằng cách không hiển thị thông báo
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
}
