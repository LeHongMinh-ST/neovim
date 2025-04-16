return {
  {
    "augmentcode/augment.vim",
    config = function()
      vim.g.augment_workspace_folders = {
        "/var/www/st/st.students/",
        "/var/www/st/st.vnua-sso/",
        "/var/www/p48/partner-prop-api/",
        "/var/www/p48/app-frontend-vendor/",
        "/var/www/p48/app-frontend-partner/",
      }
      vim.keymap.set("n", "<leader>ac", ":Augment chat<CR>", { desc = "Augment chat" })
      vim.keymap.set("v", "<leader>ac", ":Augment chat<CR>", { desc = "Augment chat" })
      vim.keymap.set("n", "<leader>an", ":Augment chat-new<CR>", { desc = "Augment chat-new" })
      vim.keymap.set("n", "<leader>at", ":Augment chat-toggle<CR>", { desc = "Augment chat-toggle" })
      vim.keymap.set("i", "<C-y>", "<cmd>call augment#Accept()<CR>", { noremap = true, silent = true })
      vim.keymap.set("i", "<CR>", '<cmd>call augment#Accept("\\n")<CR>', { noremap = true, silent = true })
    end,
  },
}
