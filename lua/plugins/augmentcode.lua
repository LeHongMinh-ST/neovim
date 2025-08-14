return {
  -- "xTacobaco/cursor-agent.nvim",
  -- config = function()
  --   vim.keymap.set("n", "<leader>ca", ":CursorAgent<CR>", { desc = "Cursor Agent: Toggle terminal" })
  --   vim.keymap.set("v", "<leader>ca", ":CursorAgentSelection<CR>", { desc = "Cursor Agent: Send selection" })
  --   vim.keymap.set("n", "<leader>cA", ":CursorAgentBuffer<CR>", { desc = "Cursor Agent: Send buffer" })
  -- end,
  -- {
  --   "Exafunction/codeium.nvim",
  --   cmd = "Codeium",
  --   event = "InsertEnter",
  --   build = ":Codeium Auth",
  --   opts = {
  --     enable_cmp_source = vim.g.ai_cmp,
  --     virtual_text = {
  --       enabled = not vim.g.ai_cmp,
  --       key_bindings = {
  --         accept = false, -- handled by nvim-cmp / blink.cmp
  --         next = "<M-]>",
  --         prev = "<M-[>",
  --       },
  --     },
  --     function()
  --       LazyVim.cmp.actions.ai_accept = function()
  --         if require("codeium.virtual_text").get_current_completion_item() then
  --           LazyVim.create_undo()
  --           vim.api.nvim_input(require("codeium.virtual_text").accept())
  --           return true
  --         end
  --       end
  --     end,
  --   },
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   optional = true,
  --   dependencies = { "codeium.nvim" },
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = "codeium",
  --       group_index = 1,
  --       priority = 100,
  --     })
  --   end,
  -- },
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    cmd = {
      "SupermavenUseFree",
    },
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = { cpp = true }, -- or { "cpp", }
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
        log_level = "info", -- set to "off" to disable logging completely
        disable_inline_completion = false, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
        condition = function()
          return false
        end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
      })
    end,
  },
}
