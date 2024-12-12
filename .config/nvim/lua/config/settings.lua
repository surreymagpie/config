-- Line numbering
vim.opt.number = true                           -- show line numbers
vim.opt.numberwidth = 5
vim.opt.relativenumber = true                   -- helps to gauge jumps

-- Formatting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.listchars = {
  eol = "¬",
  trail = "-",
  tab = ">·",
  extends = ">",
  precedes = "<"
}

-- General
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.wrap = false                            -- display lines as one long line

-- Search
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- smart case

-- Appearance
vim.opt.termguicolors = true

