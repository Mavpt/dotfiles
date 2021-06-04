----- Backup, Swap and Undo -----
vim.o.backup    = true
vim.o.backupdir = os.getenv("HOME") .. "/.cache/vim/backup"

vim.o.swapfile  = true
vim.o.dir       = os.getenv("HOME") .. "/.cache/vim/swap"

vim.bo.undofile = true
vim.o.undodir   = os.getenv("HOME") .. "/.cache/vim/undo"

--- Mouse and System Clipboard -----
vim.o.mouse = "a"               -- Mouse
vim.o.clipboard = "unnamedplus" -- System clipboard

----- Colorscheme -----
vim.o.termguicolors = true
vim.cmd("colorscheme nord")

----- Encoding -----
vim.o.encoding      = "utf-8"
vim.o.fileencodings = "utf-8"

----- Splits -----
vim.o.splitbelow = false
vim.o.splitright = false

----- Syntax Highlighting -----
vim.o.syntax = "on"

----- Cursor position -----
vim.o.ruler = true

vim.wo.number         = true
vim.wo.relativenumber = true

vim.wo.cursorline   = true
vim.wo.cursorcolumn = true

----- Searching -----
vim.o.hlsearch   = true
vim.o.ignorecase = true

----- Identation -----
vim.o.expandtab   = true
vim.o.shiftwidth  = 8
vim.o.softtabstop = 8
vim.o.tabstop     = 8
