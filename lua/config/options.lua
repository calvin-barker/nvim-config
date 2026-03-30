local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.wrap = true
opt.linebreak = true
opt.breakindent = true

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
opt.showmode = true 

opt.updatetime = 250

opt.splitbelow = true
opt.splitright = true

opt.spelllang = {"en_us"}
opt.conceallevel = 0

opt.undofile = true

vim.cmd.colorscheme("sorbet")
