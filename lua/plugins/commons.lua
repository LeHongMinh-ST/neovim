return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({})
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "Increname",
    config = function()
      require("inc_rename").setup({})
    end,
  },
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      if LazyVim.pick.want() ~= "telescope" then
        return
      end
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- stylua: ignore
    vim.list_extend(Keys, {
      { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References", nowait = true },
      { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
      { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
    })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "typescript",
      "html",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "twig",
      "php",
      "vue",
      "php",
      "lua",
      "javascript",
    },
    event = "LazyFile",
    opts = {

      -- Defaults
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = true, -- Auto close on trailing </
    },
    per_filetype = {
      ["html"] = {
        enable_close = false,
      },
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "APZelos/blamer.nvim",
  },
}
