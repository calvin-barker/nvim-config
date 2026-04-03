local map = vim.keymap.set

vim.g.mapleader = " "

-- Namespace: toggle <t>
-- In normal mode, toggle spellcheck.
map("n", "<leader>ts", function()
  vim.opt_local.spell = not vim.opt_local.spell:get()
end, { desc = "Toggle spellcheck" })

-- In normal mode, toggle line wrapping.
map("n", "<leader>tw", function()
  vim.opt_local.wrap = not vim.opt_local.wrap:get()
end, { desc = "Toggle wrap" })

-- In normal mode, toggle Markdown conceal level.
-- Example: conceallevel = 0 -> [OpenAI](https://openai.com)
-- Example: conceallevel = 2 -> OpenAI
map("n", "<leader>tc", function()
  vim.opt_local.conceallevel = vim.opt_local.conceallevel:get() == 0 and 2 or 0
end, { desc = "Toggle markdown conceal" })


-- Toggle a terminal in a horizontal split.
-- Reuses the same terminal buffer across toggles.
local term_buf = nil
map("n", "<leader>tt", function()
  -- If terminal is visible, hide it
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        vim.api.nvim_win_close(win, false)
        return
      end
    end
  end
  -- Open a split and either reuse or create the terminal buffer
  vim.cmd("botright split")
  vim.cmd("resize 15")
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_set_current_buf(term_buf)
  else
    vim.cmd("terminal")
    term_buf = vim.api.nvim_get_current_buf()
  end
  vim.cmd("startinsert")
end, { desc = "Toggle terminal" })

-- General quality of life.
-- In normal mode, clear the search highlight.
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- In normal mode, save the current file.
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Write file" })

-- In normal mode, quit the window.
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })

