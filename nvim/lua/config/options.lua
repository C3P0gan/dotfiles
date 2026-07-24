vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.g.netrw_keepdir = 0

vim.g.netrw_banner = 0
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#f8f8f2" })
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ad8be3" })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#ff79c6" })
    end
})

vim.g.python3_host_prog="home/cristoffer_pogan/miniconda3/envs/pynvim/bin/python"
