-- Harper grammar/spell checker is managed via mason-lspconfig in plugins.lua.
-- LSP keymaps (go-to, code action, diagnostics) are in the LspAttach autocmd in plugins.lua.


-- Format with Prettier on save and via keymap
vim.opt_local.formatprg = "prettier --parser markdown --prose-wrap always --print-width 120"
-- Auto-format disabled: causes noisy diffs in shared repos
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   buffer = 0,
--   callback = function()
--     local cursor = vim.api.nvim_win_get_cursor(0)
--     vim.cmd("silent! %!prettier --parser markdown --prose-wrap always --print-width 120")
--     local last = vim.fn.line("$")
--     cursor[1] = math.min(cursor[1], last)
--     vim.api.nvim_win_set_cursor(0, cursor)
--   end,
-- })

-- Heading navigation: ]h / [h
-- On a heading: jumps to the next/prev heading at the same level (e.g. ## -> ##)
-- On a non-heading: jumps to the nearest heading of any level

-- Returns the heading level (1-6) for a line, or 0 if not a heading.
local function heading_level(lnum)
  local line = vim.fn.getline(lnum)
  local hashes = line:match("^(#+) ") -- match leading #'s followed by a space
  return hashes and #hashes or 0
end

-- Scan forward (direction=1) or backward (direction=-1) for a matching heading.
local function jump_heading(direction)
  local cur = vim.fn.line(".")
  local level = heading_level(cur) -- 0 if cursor isn't on a heading
  local last = vim.fn.line("$")
  local lnum = cur + direction
  while lnum >= 1 and lnum <= last do
    local l = heading_level(lnum)
    -- Not on a heading: stop at any heading. On a heading: stop at same level.
    if (level == 0 and l > 0) or (level > 0 and l == level) then
      vim.cmd(tostring(lnum))
      return
    end
    lnum = lnum + direction
  end
end

vim.keymap.set("n", "]h", function() jump_heading(1) end, { buffer = true, desc = "Next heading (same level)" })
vim.keymap.set("n", "[h", function() jump_heading(-1) end, { buffer = true, desc = "Prev heading (same level)" })

-- Heading highlights
vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#87afd7", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#87d75f", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#d7af5f", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#af87d7" })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#af87d7", italic = true })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#af87d7", italic = true })
