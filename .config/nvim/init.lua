-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.relativenumber = false
-- vim.opt.shell = "zsh -i"
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true

-- disable treesitter context bottom border and give it a background
vim.cmd[[hi TreesitterContextBottom gui=NONE]]
vim.cmd[[hi TreesitterContextBottom guibg=#2a2b3c]]