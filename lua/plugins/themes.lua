return {
  {
    "Mofiqul/vscode.nvim",
    config = function()
      -- Set the background theme (dark or light)
      -- vim.o.background = "light"
      -- vim.o.background = "dark" -- Change to "light" if you prefer
      -- local c = require("vscode.colors").get_colors()

      require("vscode").setup({
        -- Alternatively set style in setup
        -- style = "light",

        -- Enable transparent background
        -- transparent = true,

        -- Enable italic comment
        -- italic_comments = true,

        -- Underline `@markup.link.*` variants
        -- underline_links = true,

        -- Disable nvim-tree background color

        -- disable_nvimtree_bg = true,
        -- Override colors (see ./lua/vscode/colors.lua)
        -- color_overrides = {
        --   vscLineNumber = "#FFFFFF",
        -- },

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        -- group_overrides = {
        --   -- this supports the same val table as vim.api.nvim_set_hl
        --   -- use colors from this colorscheme by requiring vscode.colors!
        --   Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        -- },
      })

      -- Load the theme without affecting devicon colors
      vim.cmd.colorscheme("vscode")
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = function()
      return {
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
    -- config = function()
    --   require("kanagawa").setup({})
    -- end,
  },
  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      }
    end,
  },
  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
