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
vim.o.statuscolumn = '%s%=%{v:virtnum==0?(v:relnum?v:relnum:v:lnum):""} %{v:virtnum==0?(foldlevel(v:lnum)>foldlevel(v:lnum-1)?(foldclosed(v:lnum)>=0?"▸ ":"▾ "):"  "):"  "}'

vim.cmd.colorscheme("sorbet")
