----- Global Variables -----
CONFIG_PATH = vim.fn.stdpath('config') .. "/"
DATA_PATH   = vim.fn.stdpath('data')   .. "/"
CACHE_PATH  = vim.fn.stdpath('cache')  .. "/"

----- Plugins -----
require("plugins")

----- Keymap -----
require("keymap")
require("settings")

------ Plugin Settings ------
require("plugconfig/lspconfig")
require("plugconfig/nvim-treesitter")
require("plugconfig/nvim-compe")
vim.cmd("source " .. CONFIG_PATH .. "plugconfig/vimwiki.vim")
vim.cmd("source " .. CONFIG_PATH .. "plugconfig/vim-fugitive.vim")
--require("plugconfig/vimwiki")
--require(plugconfig/vim-fugitive)
