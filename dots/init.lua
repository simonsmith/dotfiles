require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'folke/tokyonight.nvim'
  use 'hoob3rt/lualine.nvim'

  -- Navigate between vim and tmux splits
  use 'christoomey/vim-tmux-navigator'
  -- Restore `FocusLost` and `FocusGained` events in tmux
  use 'tmux-plugins/vim-tmux-focus-events'

  -- File browser
  use 'mcchrish/nnn.vim'

  -- Close all buffers except current
  use 'schickling/vim-bufonly'
  -- Close buffers without losing window layout
  use 'moll/vim-bbye'
  --  Manage buffers in a list
  use {'jlanzarotta/bufexplorer', opt = true, cmd = {'BufExplorer'}}

  -- Search in files
  use {'mhinz/vim-grepper', opt = true, cmd = {'Grepper'}}

  use 'sheerun/vim-polyglot'

  -- Allow plugins to be repeated with dot
  use 'tpope/vim-repeat'
  -- Comment out blocks of code
  use 'b3nj5m1n/kommentary'
  -- Toggle location and quickfix lists
  use 'Valloric/ListToggle'
  -- Display quickfix ith a fancy window and commands
  use 'kevinhwang91/nvim-bqf'
  -- Move between windows and allow swapping position
  use 't9md/vim-choosewin'
  -- Remember cursor position in closed buffers
  use 'dietsche/vim-lastplace'
  -- Open files from Quickfix
  use 'yssl/QFEnter'
  -- Move blocks of code with ALT+j/k
  use 'matze/vim-move'

  -- Allow motions like `w`, `b` and `iw` to work on camel case
  use 'chaoren/vim-wordmotion'
  -- Improve text objects for arguments, brackets etc
  use 'wellle/targets.vim'

  -- Set spaces and other settings on a per project basis
  use 'editorconfig/editorconfig-vim'
  -- Whitespace removal
  use 'ntpeters/vim-better-whitespace'

  -- Split and join HTML tags, JS objects etc
  use 'AndrewRadev/splitjoin.vim'
  -- Make it easy to add/remove/change brackets, quotes etc
  use 'tpope/vim-surround'

  -- Stop everything saving to a register and instead rely on just `m` for cut
  use 'svermeulen/vim-easyclip'

  use 'xolox/vim-misc'
  use 'xolox/vim-session'

  -- Make managing tabs easier with rename, add, delete etc
  use 'gcmt/taboo.vim'

  use 'SirVer/ultisnips'
  use 'simonsmith/vim-custom-snippets'

  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'junegunn/gv.vim'

  -- Easy HTML and CSS generation
  use 'mattn/emmet-vim'
  -- Automatically add a closing HTML tag
  use 'alvan/vim-closetag'
  -- CSS highlight
  use {'rrethy/vim-hexokinase', run = 'make hexokinase'}

  use 'pangloss/vim-javascript'

  use {'neoclide/coc.nvim', branch = 'release'}
  use {'neoclide/coc-tsserver', run = 'yarn install --frozen-lockfile'}
  use {'neoclide/coc-pairs', run = 'yarn install --frozen-lockfile'}
  use {'neoclide/coc-eslint', run = 'yarn install --frozen-lockfile'}
  use {'neoclide/coc-json', run = 'yarn install --frozen-lockfile'}
  use {'neoclide/coc-css', run = 'yarn install --frozen-lockfile'}
  use {'bmatcuk/coc-stylelintplus', run = 'yarn install --frozen-lockfile'}
  use {'antonk52/coc-cssmodules', run = 'yarn install --frozen-lockfile'}
  use {'neoclide/coc-yaml', run = 'yarn install --frozen-lockfile'}
  use {'neoclide/coc-html', run = 'yarn install --frozen-lockfile'}
  use {'neoclide/coc-prettier', run = 'yarn install --frozen-lockfile'}
  use {'neoclide/coc-snippets', run = 'yarn install --frozen-lockfile'}
end)

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'diagnostics',
        sources = {'coc'},
        sections = {'error', 'warn'},
        symbols = {error = 'errors: ', warn = 'warnings: ', info = 'info: '}
      }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {{'filename', path = 1}},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_colors = { bg_popup = "#485173", bg_float = "#485173"}

vim.cmd('colorscheme tokyonight')

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

vim.g.mapleader = ' '
vim.o.shortmess = 'aoOtIWcFs'

-- Turn off swapfiles
vim.o.swapfile = false
vim.o.backup = false
vim.o.wb = false

-- Allow editing of binary files
-- Must be set before expandtab
-- http://stackoverflow.com/a/26901774
vim.o.binary = true

-- Enable term 24 bit colour
vim.o.termguicolors = true

-- Make it obvious where 80 characters is
vim.o.textwidth = 80

-- Use ``indent`` based folding
vim.o.foldmethod = "indent"
-- Disable all folds on file open until `zc` or `zM` etc is used
vim.o.foldenable = false

-- With :vim.o.hidden, opening a new file when the current buffer has unsaved
-- changes causes files to be hidden instead of closed
vim.o.hidden = true

vim.o.sessionoptions = 'buffers,curdir,tabpages,winsize'

-- Briefly move the cursor to the matching brace
vim.o.showmatch = true

-- Lazyredraw attempts to solve Vim lag by reducing the amount of
-- processing required. When enabled, any action that is not typed
-- will not cause the screen to redraw
vim.o.lazyredraw = true

-- Don't display the current mode (Insert, Visual, Replace)
-- in the status line. This info is already shown in the
-- Airline status bar.
vim.o.showmode = false

-- Stop vim trying to syntax highlight long lines, typically found in minified
-- files. This greatly reduces lag yet is still wide enough for large displays
vim.o.synmaxcol = 500

-- Highlight current line
vim.o.cursorline = true

-- Indent using two spaces.
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Smoother scrolling when moving horizontally
vim.o.sidescroll = 1

-- Use spaces, not tabs
vim.o.expandtab = true

vim.cmd('set complete-=i')
vim.cmd('set complete+=kspell')
vim.cmd('set completeopt-=preview')
vim.cmd('set completeopt-=preview')

-- This is set low so that gitgutter updates reasonably quickly
-- https://github.com/airblade/vim-gitgutter#when-are-the-signs-updated
vim.o.updatetime = 300

-- Don't wrap lines
vim.o.wrap = false

-- Keep the cursor in the same place when switching buffers
vim.o.startofline = false

-- Show col and line position in the statusbar
vim.o.ruler = true

-- Open new split panes to right and bottom, which feels more natural
vim.o.splitbelow = true
vim.o.splitright = true

-- Ignore case of searches
vim.o.ignorecase = true

-- If a pattern contains an uppercase letter
-- it is case sensitive, otherwise, it is not
vim.o.smartcase = true

-- Use the OS clipboard by default (on versions compiled with `+clipboard`)
vim.o.clipboard = "unnamed"

-- Spell check
vim.o.spelllang = "en"

-- Where it should get the dictionary files
-- let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

-- For autocompletion, complete as much as you can.
vim.o.wildmode= "list:longest,full"

-- don't add extra space after ., !, etc. when joining
vim.o.joinspaces = false

-- Eliminate delay when switching modes
vim.o.ttimeoutlen = 0

-- Enable mouse with tmux
vim.o.mouse= "a"

-- Auto save changes before switching buffer
vim.o.autowrite = true

-- Add the g flag to search/replace by default
vim.o.gdefault = true

-- Centralize backups, swapfiles and undo history
vim.o.backupdir = "~/.config/nvim/backups"
vim.o.directory = ".,$TEMP"

vim.o.undodir= "~/.config/nvim/undo"
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000

-- Always show sign column for git icons
vim.o.signcolumn = "yes"

-- Don’t create backups when editing files in certain directories
vim.o.backupskip = "/tmp/*,/private/tmp/*"

-- Respect modeline in files
vim.o.modeline = true
vim.o.modelines = 4

-- Enable per-directory .vimrc files and disable unsafe commands in them
vim.o.exrc = true
vim.o.secure = true

-- Show “invisible” characters
-- vim.o.lcs = "tab:▸\ ,trail:·,nbsp:_"
vim.o.list = true

-- Disable error bells
vim.o.errorbells = false

-- Show the current mode
vim.o.title = true

-- Show the (partial) command as it’s being typed
vim.o.showcmd = true

-- Path and file extensions to look for when using `gf`
vim.o.suffixes = vim.o.suffixes .. ".css,index.css,.js,.jsx,.scss"
vim.o.path = vim.o.path .. ".,src"

-- Start scrolling before cursor gets to the edge
vim.o.scrolloff = 3
vim.o.sidescrolloff = 15
vim.o.sidescroll = 1

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function vmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

-- Remap annoying mistakes to something useful
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

-- Force j and k to work on display lines
nmap('<leader>v', '<cmd>vsplit<cr>')
nmap('<leader>x', '<cmd>split<cr>')

-- Save all
nmap('<leader>w', 'wa<cr>')

-- Make `Y` work from the cursor to the end of line
nmap('Y', 'y$')

-- Reformat whole file and move back to original position
nmap('g=', 'gg=G``')

-- Spellcheck
nmap('<f6>', '<cmd>setlocal spell!<cr>')

-- Force j and k to work on display lines
nmap('j', 'gj')
nmap('k', 'gk')
vmap('j', 'gj')
vmap('k', 'gk')

-- Clear search (highlight)
nmap('<leader>k', '<cmd>noh<cr>')

-- Automatically 'gv' (go to previously selected visual block)
-- after indenting or unindenting.
vmap('<', '<gv')
vmap('>', '>gv')

-- Press enter for newline without insert
nmap('<cr>', 'o<esc>')

-- but don't effect command line mode
vim.cmd('autocmd CmdwinEnter * nnoremap <cr> <cr>')
vim.cmd('autocmd CmdwinLeave * nnoremap <cr> o<esc>')

vim.g.session_autoload = 'no'
vim.g.session_autosave = 'yes'

