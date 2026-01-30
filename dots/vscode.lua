-- VS Code Neovim compatible config
-- https://open-vsx.org/vscode/item?itemName=asvetliakov.vscode-neovim

local vim = vim

-- Leader keys - set before any mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Only load this config in VS Code
if not vim.g.vscode then
  return
end

-- Basic editor settings that work in VS Code
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 15

-- Plugins that work well with VS Code
local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")

-- Text manipulation (safe for VS Code)
Plug("tpope/vim-repeat")
Plug("kylechui/nvim-surround")
Plug("wellle/targets.vim")
Plug("kana/vim-textobj-user")
Plug("kana/vim-textobj-entire")
Plug("kana/vim-textobj-line")
Plug("svermeulen/vim-cutlass")
Plug("gbprod/substitute.nvim")
Plug("chaoren/vim-wordmotion")

vim.call("plug#end")

-- Plugin configurations
require("nvim-surround").setup()
require("substitute").setup()

-- Movement improvements
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("v", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("n", "<cr>", "o<Esc>")

-- Editing enhancements
vim.keymap.set("n", "dD", "S<Esc>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("v", "y", "y`]")
vim.keymap.set("v", "p", "p`]")
vim.keymap.set("n", "p", "p`]")

-- Visual mode improvements
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Substitute plugin mappings
vim.keymap.set("n", "s", require("substitute").operator)
vim.keymap.set("n", "ss", require("substitute").line)
vim.keymap.set("x", "s", require("substitute").visual)
vim.keymap.set("n", "sx", require("substitute.exchange").operator)
vim.keymap.set("n", "sxx", require("substitute.exchange").line)
vim.keymap.set("x", "X", require("substitute.exchange").visual)
vim.keymap.set("n", "sxc", require("substitute.exchange").cancel)

-- Text objects (vim-textobj-entire)
vim.keymap.set("x", "aE", "<Plug>(textobj-entire-a)")
vim.keymap.set("o", "aE", "<Plug>(textobj-entire-a)")
vim.keymap.set("x", "iE", "<Plug>(textobj-entire-i)")
vim.keymap.set("o", "iE", "<Plug>(textobj-entire-i)")

-- vim-cutlass configuration (m for cut instead of d)
vim.keymap.set("n", "m", "d")
vim.keymap.set("x", "m", "d")
vim.keymap.set("n", "mm", "dd")

-- Command typo fixes
vim.cmd([[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Qa q
cnoreabbrev Qall qall
]])

