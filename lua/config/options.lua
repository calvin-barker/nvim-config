local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.linebreak = true
opt.breakindent = true
opt.showbreak = "> "

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 5
opt.sidescrolloff = 8

opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.title = true
opt.visualbell = true

-- Effectively turns on autosave.
opt.autowriteall = true
opt.updatetime = 250

opt.splitright = true
opt.startofline = true

opt.spelllang = {"en_us"}

opt.undofile = true

-- Treesitter-based folding with chevron indicators
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldcolumn = "0"
function _G.statuscolumn()
  local winid = vim.g.statusline_winid
  local bufnr = vim.api.nvim_win_get_buf(winid)
  if vim.bo[bufnr].filetype == "neo-tree" then return "" end
  if vim.v.virtnum ~= 0 then return "      " end
  local lnum = vim.v.relnum == 0 and vim.v.lnum or vim.v.relnum
  local fold = ""
  if vim.fn.foldlevel(vim.v.lnum) > vim.fn.foldlevel(vim.v.lnum - 1) then
    fold = vim.fn.foldclosed(vim.v.lnum) >= 0 and " ▸ " or " ▾ "
  else
    fold = "   "
  end
  return "%s%" .. "=" .. lnum .. fold
end
vim.o.statuscolumn = "%!v:lua.statuscolumn()"

vim.cmd.colorscheme("sorbet")
