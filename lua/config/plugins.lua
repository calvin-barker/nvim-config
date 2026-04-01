vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
})

require("nvim-tree").setup({
  filters = {
    dotfiles = false,
  },
})

vim.keymap.set("n", "<leader>te", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
