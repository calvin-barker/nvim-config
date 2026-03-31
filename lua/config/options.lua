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

vim.cmd.colorscheme("sorbet")
