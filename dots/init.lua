local vim = vim
local Plug = vim.fn["plug#"]

-- Set these early to ensure they're available for plugins

-- Leader keys - set before any mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable 24-bit color support
vim.opt.termguicolors = true

-- plugins
-- ============================================================================

vim.call("plug#begin", "~/.config/nvim/plugged")

-- Theme and appearance
Plug("folke/tokyonight.nvim") -- Modern colorscheme
Plug("hoob3rt/lualine.nvim") -- Status line
Plug("nanozuki/tabby.nvim") -- Tab line customization
Plug("nvim-tree/nvim-web-devicons") -- File type icons

-- Terminal integration
Plug("akinsho/toggleterm.nvim", { ["tag"] = "v2.13.1" })
Plug("christoomey/vim-tmux-navigator") -- Seamless tmux/vim navigation

-- File finding and search
Plug("junegunn/fzf", { ["dir"] = "~/.fzf", ["do"] = "./install --all" })
Plug("ibhagwan/fzf-lua", { ["branch"] = "main" }) -- Lua-based FZF interface
Plug("nvim-pack/nvim-spectre") -- Search and replace across files
Plug("nvim-lua/plenary.nvim") -- Lua utility functions (required by many plugins)

-- Editor enhancements
Plug("rcarriga/nvim-notify") -- Better notifications
Plug("MunifTanjim/nui.nvim") -- UI component library
Plug("folke/noice.nvim") -- Better command line, messages, and popupmenu
Plug("folke/which-key.nvim") -- Key binding help
Plug("folke/persistence.nvim") -- Session management
Plug("y3owk1n/time-machine.nvim") -- Time travel for buffers
Plug("OXY2DEV/markview.nvim")
Plug("fasterius/simple-zoom.nvim") -- tmux style zoom

-- File management
Plug("mcchrish/nnn.vim") -- NNN file manager integration

-- Buffer management
Plug("schickling/vim-bufonly") -- Close all buffers except current
Plug("moll/vim-bbye") -- Better buffer deletion

-- Syntax highlighting and parsing
Plug("nvim-treesitter/nvim-treesitter", { ["branch"] = "main", ["do"] = ":TSUpdate" })
Plug("nvim-treesitter/nvim-treesitter-textobjects", { ["branch"] = "main" }) -- Textobjects (main branch)
Plug("linrongbin16/gitlinker.nvim", { ["commit"] = "63cfbb7" }) -- Generate links to Git hosting

-- Text editing and manipulation
Plug("tpope/vim-repeat") -- Repeat plugin commands with .
Plug("b3nj5m1n/kommentary") -- Smart commenting
Plug("kevinhwang91/nvim-bqf") -- Better quickfix window
Plug("matze/vim-move") -- Move lines and selections
Plug("jiangmiao/auto-pairs") -- Auto-close brackets, quotes, etc.
Plug("stevearc/conform.nvim") -- Code formatting

-- Text objects and motions
Plug("chaoren/vim-wordmotion") -- Better word motions (camelCase, etc.)
Plug("wellle/targets.vim") -- Additional text objects
Plug("kana/vim-textobj-user") -- Framework for custom text objects
Plug("kana/vim-textobj-entire") -- Text object for entire buffer
Plug("kana/vim-textobj-line") -- Text object for lines

-- Code quality
Plug("ntpeters/vim-better-whitespace") -- Highlight trailing whitespace

-- Advanced editing
Plug("kylechui/nvim-surround") -- Manipulate surrounding characters
Plug("svermeulen/vim-cutlass") -- Separate cut and delete operations
Plug("gbprod/substitute.nvim") -- Enhanced substitute operations

-- Git integration
Plug("tpope/vim-fugitive") -- Git commands in Vim
Plug("junegunn/gv.vim") -- Git commit browser
Plug("lewis6991/gitsigns.nvim") -- Git signs in gutter
Plug("sindrets/diffview.nvim") -- Git diff and merge tool

-- Web development
Plug("mattn/emmet-vim") -- HTML/CSS abbreviation expansion
Plug("alvan/vim-closetag") -- Auto-close HTML tags
Plug("jwalton512/vim-blade") -- Laravel Blade template support

-- Language Server Protocol and completion
Plug("neoclide/coc.nvim", { ["branch"] = "release" }) -- Intellisense engine

vim.call("plug#end")

-- coc extensions
-- ============================================================================

vim.g.coc_global_extensions = {
  "coc-tsserver", -- TypeScript/JavaScript
  "coc-eslint", -- ESLint integration
  "coc-oxc", -- Oxlint integration
  "coc-json", -- JSON support
  "coc-css", -- CSS support
  "coc-stylelintplus", -- Stylelint integration
  "coc-cssmodules", -- CSS Modules support
  "coc-blade", -- Laravel Blade support
  "coc-yaml", -- YAML support
  "coc-html", -- HTML support
  "@yaegassy/coc-intelephense", -- PHP language server
  "@yaegassy/coc-tailwindcss3", -- Tailwind CSS support
  "@yaegassy/coc-laravel", -- Laravel support
  "@yaegassy/coc-volar", -- Modern Vue.js language server
}

-- editor settings
-- ============================================================================

-- File handling
vim.opt.swapfile = false -- Disable swap files
vim.opt.backup = false -- Disable backup files
vim.opt.writebackup = true
vim.opt.backupcopy = "yes" -- Preserve symlinks when writing
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undolevels = 1000 -- Maximum number of undos
vim.opt.undoreload = 10000 -- Maximum lines to save for undo on buffer reload
vim.opt.backupdir = "$HOME/.config/nvim/backups"
vim.opt.directory = ".,$TEMP"

-- Display and appearance
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.showmode = false -- Hide mode indicator (lualine shows it)
vim.opt.showcmd = true -- Show command as it's being typed
vim.opt.ruler = true -- Show line and column numbers
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.title = true -- Enable window title
vim.opt.synmaxcol = 250 -- Limit syntax highlighting to avoid lag
vim.opt.fillchars:append({ diff = "-" })

-- Text formatting and layout
vim.opt.textwidth = 80 -- Maximum line width
vim.opt.wrap = false -- Disable line wrapping
vim.opt.linebreak = true -- Break lines at word boundaries
vim.opt.startofline = false -- Keep cursor column when moving vertically

-- Indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Number of spaces for a tab
vim.opt.softtabstop = 2 -- Number of spaces for tab in insert mode
vim.opt.shiftwidth = 2 -- Number of spaces for auto-indent

-- Folding
vim.opt.foldmethod = "indent" -- Use indentation for folding
vim.opt.foldenable = false -- Start with all folds open

-- Search settings
vim.opt.ignorecase = true -- Case-insensitive search
vim.opt.smartcase = true -- Case-sensitive if uppercase present

-- Scrolling
vim.opt.scrolloff = 3 -- Minimum lines to keep above/below cursor
vim.opt.sidescrolloff = 15 -- Minimum columns to keep left/right of cursor
vim.opt.sidescroll = 1 -- Scroll horizontally one column at a time

-- Window splitting
vim.opt.splitbelow = true -- Open horizontal splits below
vim.opt.splitright = true -- Open vertical splits to the right

-- System integration
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.hidden = true -- Allow switching buffers without saving

-- Completion and wildmenu
vim.opt.complete:remove("i") -- Don't scan included files
vim.opt.complete:append("kspell") -- Add spell checking to completion
vim.opt.completeopt:remove("preview") -- Don't show preview window

-- Performance
vim.opt.updatetime = 300 -- Faster completion and git signs
vim.opt.ttyfast = true -- Fast terminal connection

-- Session management
vim.opt.sessionoptions:append("tabpages,globals") -- Include tabs and globals in sessions

-- Spell checking
vim.opt.spelllang = "en" -- English spelling

-- Security and modelines
vim.opt.modeline = true -- Enable modelines
vim.opt.modelines = 4 -- Check first/last 4 lines for modelines
vim.opt.exrc = true -- Enable project-specific vimrc
vim.opt.secure = true -- Restrict dangerous commands in project vimrc

-- Error handling
vim.opt.errorbells = false -- Disable error bells
vim.opt.shortmess = "aoOtIWcFs" -- Shorten various messages

-- File navigation
vim.opt.path:append(".,src") -- Add current and src dirs to path
vim.opt.suffixesadd:append(".css,index.css,.js,.jsx,.scss,.ts,.tsx") -- File extensions for gf

-- HTML specific
vim.g.html_indent_tags = "li|p" -- Treat <li> and <p> as block tags

-- theme configuration
-- ============================================================================

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function read_theme_mode()
  local path = vim.fn.expand("~/.config/theme")
  local ok, lines = pcall(vim.fn.readfile, path)
  if not ok or #lines == 0 then
    return "dark"
  end
  local mode = trim(lines[1])
  if mode == "light" then
    return "light"
  end
  return "dark"
end

local function write_theme_mode(mode)
  local path = vim.fn.expand("~/.config/theme")
  pcall(vim.fn.writefile, { mode }, path)
end

local setup_fzf_lua

local function apply_tokyonight(style)
  require("tokyonight").setup({
    style = style, -- moon, storm, night, or day
    light_style = "day", -- Light variant style
    transparent = false, -- Disable to avoid transparent background
    terminal_colors = true, -- Configure terminal colors
    styles = {
      comments = { italic = false }, -- Disable italic comments
      keywords = { italic = false }, -- Disable italic keywords
    },
    day_brightness = 0.3, -- Brightness for day style
    hide_inactive_statusline = true, -- Keep statusline visible
    dim_inactive = false, -- Don't dim inactive windows
    lualine_bold = false, -- Don't bold lualine headers
    on_colors = function(colors)
      if style == "day" then
        colors.bg_highlight = "#daddea"
      end
    end, -- Color customization hook
    on_highlights = function(highlights, colors) end, -- Highlight customization hook
  })

  vim.cmd("silent! colorscheme tokyonight-" .. style)
end

local theme_mode = read_theme_mode()
local theme_style = theme_mode == "light" and "day" or "moon"
apply_tokyonight(theme_style)

vim.keymap.set("n", "<leader>T", function()
  if vim.fn.executable("theme") == 1 then
    vim.fn.system({ "theme", "toggle" })
  else
    local current = read_theme_mode()
    local next_mode = current == "light" and "dark" or "light"
    write_theme_mode(next_mode)
  end

  local new_mode = read_theme_mode()
  local new_style = new_mode == "light" and "day" or "moon"
  apply_tokyonight(new_style)
  if setup_fzf_lua then
    setup_fzf_lua()
  end
end, { desc = "Toggle theme day/night" })

-- plugin configurations
-- ============================================================================

-- Web Dev Icons
require("nvim-web-devicons").setup()

-- Which Key - Show key binding help
local wk = require("which-key")
wk.setup({
  show_help = false,
  plugins = { spelling = true },
})

-- Noice - Better UI for messages, cmdline and popupmenu
require("noice").setup({
  notify = {
    enabled = false, -- Disable noice notifications (using nvim-notify)
  },
  routes = {
    -- Filter out common noise
    { filter = { event = "msg_show", kind = "", find = "written" }, skip = true },
    { filter = { event = "msg_show", kind = "" }, skip = true },
    { filter = { event = "msg_show", kind = "lua_error" }, view = "mini" },
    { filter = { find = "oxc" }, skip = true },
    { filter = { find = "Oxlint" }, skip = true },
    { filter = { find = "Hunk" }, skip = true },
    { filter = { find = "E37" }, skip = true }, -- No write since last change
    { filter = { find = "E162" }, view = "mini" }, -- Pattern matching issues
    { filter = { find = "Invalid 'end_col': out of range" }, skip = true }, -- Treesitter highlighting errors
    { filter = { find = "Error: Range#create" }, skip = true }, -- Treesitter highlighting errors
    { filter = { find = "decoration provider.*treesitter" }, skip = true }, -- Treesitter decoration errors
    { filter = { find = "E486.*treesitter" }, skip = true },
  },
  presets = {
    command_palette = true, -- Position cmdline and popupmenu together
    long_message_to_split = true, -- Send long messages to split
  },
})

-- Toggle terminal
require("toggleterm").setup({
  direction = "horizontal",
  shade_terminals = false,
  persist_size = false,
  size = function(term)
    if term.direction == "horizontal" then
      return math.floor(vim.o.lines * 0.40)
    end
    return math.floor(vim.o.columns * 0.40)
  end,
})

wk.add({
  { "<leader>t", ":ToggleTerm<cr>", desc = "Toggle terminal", mode = "n" },
})

-- Window navigation using vim-tmux-navigator (seamlessly moves between vim and tmux)
vim.g.tmux_navigator_no_mappings = 1
wk.add({
  { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Tmux navigate left", mode = "n", silent = true },
  { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Tmux navigate down", mode = "n", silent = true },
  { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Tmux navigate up", mode = "n", silent = true },
  { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Tmux navigate right", mode = "n", silent = true },
})

local function set_toggleterm_keymaps()
  local opts = { buffer = true, silent = true }

  wk.add({
    { "<Esc>", [[<C-\><C-n>]], desc = "Exit terminal mode", mode = "t", buffer = opts.buffer, silent = opts.silent },
    { "jk", [[<C-\><C-n>]], desc = "Exit terminal mode", mode = "t", buffer = opts.buffer, silent = opts.silent },
    -- Use TmuxNavigate for seamless vim/tmux navigation from terminal buffers
    {
      "<C-h>",
      "<Cmd>TmuxNavigateLeft<CR>",
      desc = "Tmux navigate left",
      mode = "t",
      buffer = opts.buffer,
      silent = opts.silent,
    },
    {
      "<C-j>",
      "<Cmd>TmuxNavigateDown<CR>",
      desc = "Tmux navigate down",
      mode = "t",
      buffer = opts.buffer,
      silent = opts.silent,
    },
    {
      "<C-k>",
      "<Cmd>TmuxNavigateUp<CR>",
      desc = "Tmux navigate up",
      mode = "t",
      buffer = opts.buffer,
      silent = opts.silent,
    },
    {
      "<C-l>",
      "<Cmd>TmuxNavigateRight<CR>",
      desc = "Tmux navigate right",
      mode = "t",
      buffer = opts.buffer,
      silent = opts.silent,
    },
    { "<C-w>", [[<C-\><C-n><C-w>]], desc = "Window commands", mode = "t", buffer = opts.buffer, silent = opts.silent },
  })
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*toggleterm#*",
  callback = set_toggleterm_keymaps,
})

-- Time Machine - Buffer history navigation
require("time-machine").setup({})

-- FZF Lua - Fuzzy finder
local actions = require("fzf-lua.actions")
setup_fzf_lua = function()
  require("fzf-lua").setup({
    winopts = {
      height = 0.85, -- Taller window for better visibility
      width = 0.80, -- Wider for modern feel
      row = 0.40, -- Slightly lower than center
      border = "rounded", -- Smooth rounded corners
      backdrop = 70, -- Very subtle backdrop
      preview = {
        default = "builtin", -- Builtin previewer available
        hidden = "hidden", -- Start hidden, toggle with F4
        border = "rounded",
        scrollbar = "border", -- Scrollbar in border (no overlay)
        delay = 50, -- Snappy preview
        winopts = {
          number = false, -- Cleaner preview without line numbers
          relativenumber = false,
        },
      },
    },
    -- Use fzf's native theming for performance (no icons needed)
    fzf_colors = {
      ["fg"] = { "fg", "Normal" },
      ["bg"] = { "bg", "Normal" },
      ["hl"] = { "fg", "Statement" },
      ["fg+"] = { "fg", "Normal" },
      ["bg+"] = { "bg", "Visual" },
      ["hl+"] = { "fg", "Statement" },
      ["info"] = { "fg", "PreProc" },
      ["prompt"] = { "fg", "Conditional" },
      ["pointer"] = { "fg", "Exception" },
      ["marker"] = { "fg", "Keyword" },
      ["spinner"] = { "fg", "Label" },
      ["header"] = { "fg", "Comment" },
      ["gutter"] = { "bg", "Normal" },
    },
    fzf_opts = {
      ["--ansi"] = true,
      ["--info"] = "inline-right",
      ["--height"] = "100%",
      ["--layout"] = "reverse",
      ["--border"] = "none", -- We handle border via winopts
      ["--pointer"] = "▶",
      ["--marker"] = "✓",
      ["--prompt"] = "❯ ",
    },
    git = {
      files = {
        git_icons = false, -- Keep disabled for performance
        file_icons = "devicons",
      },
    },
    files = {
      rg_opts = [[--color=never --files --hidden --follow -g "!.git"]],
      fd_opts = [[--color=never --type f --hidden --follow --exclude .git]],
      git_icons = false, -- Keep disabled for performance
      file_icons = "devicons",
      prompt = "Files❯ ",
    },
    grep = {
      prompt = "Rg❯ ",
      git_icons = false,
      file_icons = false,
    },
    buffers = {
      prompt = "Buffers❯ ",
      file_icons = false,
    },
    actions = {
      files = {
        ["default"] = actions.file_edit,
        ["ctrl-v"] = actions.file_vsplit,
        ["ctrl-x"] = actions.file_split,
      },
    },
  })
end

setup_fzf_lua()

-- Surround - Manipulate surrounding characters
require("nvim-surround").setup()

-- Substitute - Enhanced substitute operations
require("substitute").setup()

-- Persistence - Session management
require("persistence").setup({
  need = 1, -- Minimum number of file buffers required
  branch = true, -- Use git branch in session name
})

-- Diffview setup
require("diffview").setup({
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = "diff3_horizontal",
      winbar_info = true,
      disable_diagnostics = true,
    },
  },
  hooks = {},
})

-- Tabby - Custom tabline
require("tabby.tabline").set(function(line)
  local theme = {
    fill = "Normal",
    head = "TabLine",
    current_tab = "TabLineSel",
    tab = "TabLine",
    win = "TabLine",
    tail = "TabLine",
  }

  return {
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep("", hl, theme.fill),
        tab.is_current() and "" or "",
        tab.name(),
        tab.close_btn(""),
        line.sep(" ", hl, theme.fill),
        hl = hl,
        margin = " ",
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep(" ", theme.win, theme.fill),
        "",
        win.buf_name(),
        line.sep(" ", theme.win, theme.fill),
        hl = theme.win,
        margin = " ",
      }
    end),
    hl = theme.fill,
  }
end, {
  nerdfont = true,
  lualine_theme = "tokyonight",
  tab_name = {
    name_fallback = function(tabid)
      return "tab-" .. tabid
    end,
  },
  buf_name = {
    mode = "unique",
  },
})

vim.o.showtabline = 1 -- Show tabline only when multiple tabs

-- Conform - Code formatting
local prettier_only = { "prettier", stop_after_first = true }
local prettier_mdformat = { "prettier", "mdformat", stop_after_first = true }
local lua_format = { "stylua", stop_after_first = true }

require("conform").setup({
  formatters_by_ft = {
    -- JavaScript/TypeScript ecosystem (Biome first, Prettier fallback)
    javascript = prettier_only,
    javascriptreact = prettier_only,
    typescript = prettier_only,
    typescriptreact = prettier_only,
    json = prettier_only,
    jsonc = prettier_only,
    html = prettier_only,
    css = prettier_only,

    -- Prettier only formats
    php = prettier_only,
    blade = prettier_only,
    vue = prettier_only,
    yaml = prettier_only,

    -- Markdown formats
    markdown = prettier_mdformat,
    ["markdown.mdx"] = prettier_mdformat,

    -- Lua formats
    lua = lua_format,
    vim = lua_format,
  },
})

-- Custom format command with range support
vim.api.nvim_create_user_command("RunFormat", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- Lualine - Status line
require("lualine").setup({
  options = {
    icons_enabled = false,
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "filename",
        path = 1, -- Show relative path
      },
    },
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_y = {
      {
        "diagnostics",
        sources = { "coc" },
        sections = { "error", "warn" },
        symbols = { error = "coc errors: ", warn = "warnings: ", info = "info: " },
      },
    },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        path = 1,
        color = { fg = "#545c7e" }, -- Dimmed color for inactive windows
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

-- Notify - Better notifications
require("notify").setup({
  timeout = 4000,
  stages = "static", -- Don't animate notifications
})

-- Git Linker - Generate links to Git hosting
require("gitlinker").setup({
  router = {
    browse = {
      ["^ssh%.github%.com"] = "https://github.com/"
        .. "{_A.ORG}/"
        .. "{_A.REPO}/blob/"
        .. "{_A.REV}/"
        .. "{_A.FILE}"
        .. "#L{_A.LSTART}"
        .. "{_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or ''}",
    },
  },
})

-- Render Markdown - Enhanced markdown rendering
require("markview").setup({
  preview = { enable = false },
})

wk.add({
  { "<leader>m", "<CMD>Markview<CR>", desc = "Toggle markview preview", mode = "n" },
})

-- Spectre - Search and replace across files
require("spectre").setup({
  mappings = {
    ["toggle_line"] = {
      map = "dd",
      cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
      desc = "toggle current item",
    },
    ["enter_file"] = {
      map = "<cr>",
      cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
      desc = "goto current file",
    },
    ["run_current_replace"] = {
      map = "<leader>rc",
      cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
      desc = "replace current line",
    },
    ["run_replace"] = {
      map = "<leader>R",
      cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
      desc = "replace all",
    },
  },
})

-- Git Signs - Git integration in sign column
require("gitsigns").setup({
  signs = {
    add = { text = "█" },
    change = { text = "█" },
    delete = { text = "█" },
    topdelete = { text = "█" },
    changedelete = { text = "█" },
    untracked = { text = "┆" },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      opts.mode = mode
      wk.add({
        vim.tbl_extend("force", { l, r }, opts),
      })
    end

    -- Git hunk navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Next git hunk" })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Previous git hunk" })
  end,
})

-- Treesitter configuration
-- NOTE: Parsers should be installed manually with :TSInstall, not on every startup.
-- The new main branch uses async installation which conflicts with the FileType
-- autocommand below. Install parsers once with:
--   :TSInstall css html javascript json json5 typescript scss vue astro dockerfile tsx c lua vim vimdoc query gitcommit diff git_rebase git_config php regex bash markdown markdown_inline yaml toml

-- Treesitter-textobjects configuration
local textobjects_ok, textobjects = pcall(require, "nvim-treesitter-textobjects")
if textobjects_ok and textobjects.setup then
  textobjects.setup({
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
      },
    },
  })
end

-- Enable treesitter highlighting on FileType (optimized)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)

    -- Skip if no language mapping exists
    if not lang then
      return
    end

    -- Temporary: skip Lua to avoid query errors
    if ft == "lua" then
      return
    end

    -- Only enable if parser is already available (no auto-install)
    if vim.treesitter.language.add(lang) then
      -- Don't enable for very large files
      local max_filesize = 100 * 1024
      local ok_stat, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
      if ok_stat and stats and stats.size > max_filesize then
        return
      end

      -- Start treesitter highlighting
      pcall(vim.treesitter.start, args.buf)

      -- Enable folding
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldmethod = "expr"
    end
  end,
})

-- Kommentary - Smart commenting
require("kommentary.config").configure_language("default", {
  prefer_single_line_comments = true,
})

--- nnn.vim configuration
require("nnn").setup({
  command = "nnn -d -H",
  set_default_mappings = 0,
  layout = "enew",
  action = {
    ["<c-x>"] = "split",
    ["<c-v>"] = "vsplit",
  },
})

wk.add({
  { "_", ":silent NnnPicker %:p:h<CR>", desc = "Open file manager here", mode = "n" },
})

-- legacy plugin configurations
-- ============================================================================

-- vim-textobj-entire configuration
vim.g.textobj_entire_no_default_key_mappings = 1

-- vim-closetag configuration
vim.g.closetag_filenames = "*.html,*.js,*.jsx"
vim.g.closetag_close_shortcut = ""

-- ag/grep configuration
if vim.fn.executable("ag") == 1 then
  vim.opt.grepprg = "ag --nogroup --nocolor"
  vim.g.ackprg = "ag --smart-case --nogroup --nocolor --column"
end

-- emmet-vim configuration
vim.g.emmet_install_only_plug = 1

-- key mappings
-- ============================================================================

-- Common command typo fixes
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

-- File operations
wk.add({
  { "<leader>w", ":silent wa<CR>", desc = "Save all files", mode = "n" },
  { "gv", ":vertical wincmd f<CR>", desc = "Open file under cursor in vsplit", mode = "n" },
})

-- Movement improvements
wk.add({
  { "k", "gk", desc = "Move up by display line", mode = { "n", "v" } },
  { "j", "gj", desc = "Move down by display line", mode = { "n", "v" } },
})

-- Editing enhancements
wk.add({
  { "dD", "S<Esc>", desc = "Delete line content", mode = "n" },
  { "Y", "y$", desc = "Yank to end of line", mode = "n" },
  { "g=", "gg=G``", desc = "Format entire file", mode = "n" },
  { "y", "y`]", desc = "Yank and keep cursor at end", mode = "v" },
  { "p", "p`]", desc = "Paste and keep cursor at end", mode = { "n", "v" } },
})

-- Zoom buffer
wk.add({
  { "<leader>z", require("simple-zoom").toggle_zoom, desc = "Zoom current buffer" },
})

-- Buffer navigation
wk.add({
  { "Q", ":silent Bdelete<CR>", desc = "Close buffer (keep window)", mode = "n", silent = true },
})

-- Tab operations
wk.add({
  { "th", ":tabprev<CR>", desc = "Previous tab", mode = "n", noremap = true, silent = true },
  { "tl", ":tabnext<CR>", desc = "Next tab", mode = "n", noremap = true, silent = true },
  { "tn", ":tabnew<CR>", desc = "New tab", mode = "n", noremap = true, silent = true },
  { "td", ":tabclose<CR>", desc = "Close tab", mode = "n", noremap = true, silent = true },
  { "to", ":tabnew | ", desc = "New tab (prompt command)", mode = "n", noremap = true },
  { "tr", ":Tabby rename_tab ", desc = "Rename tab", mode = "n", noremap = true },
})

-- Window operations
wk.add({
  { "<leader>x", ":split<CR>", desc = "Horizontal split", mode = "n" },
  { "<leader>v", ":vsplit<CR>", desc = "Vertical split", mode = "n" },
})

-- Search and replace
wk.add({
  { "<leader>k", ":noh<CR>", desc = "Clear search highlight", mode = "n" },
})

-- Utility functions
wk.add({
  { "<F6>", ":setlocal spell!<CR>", desc = "Toggle spell checking", mode = "n" },
  { "<CR>", "o<Esc>", desc = "Insert line below", mode = "n" },
})

-- Visual mode improvements
wk.add({
  { "<", "<gv", desc = "Indent left and keep selection", mode = "v" },
  { ">", ">gv", desc = "Indent right and keep selection", mode = "v" },
})

-- FZF mappings
wk.add({
  { "<C-p>", "<cmd>FzfLua git_files<cr>", desc = "FZF git files", mode = "n", noremap = true },
  { "<C-]>", "<cmd>FzfLua files<cr>", desc = "FZF files", mode = "n", noremap = true },
  { "<C-o>", "<cmd>FzfLua jumps<cr>", desc = "FZF jumps", mode = "n", noremap = true },
  { "<leader>l", "<cmd>FzfLua blines<cr>", desc = "FZF buffer lines", mode = "n", noremap = true },
  { "<Tab>", "<cmd>FzfLua buffers<cr>", desc = "FZF buffers", mode = "n", noremap = true },
  {
    "<BS>",
    "<cmd>FzfLua command_history<cr>",
    desc = "FZF command history",
    mode = "n",
    noremap = true,
    silent = true,
  },
})

-- Substitute plugin mappings
wk.add({
  { "s", require("substitute").operator, desc = "Substitute operator", mode = "n", noremap = true },
  { "ss", require("substitute").line, desc = "Substitute line", mode = "n", noremap = true },
  { "s", require("substitute").visual, desc = "Substitute selection", mode = "x", noremap = true },
  { "sx", require("substitute.exchange").operator, desc = "Exchange operator", mode = "n", noremap = true },
  { "sxx", require("substitute.exchange").line, desc = "Exchange line", mode = "n", noremap = true },
  { "X", require("substitute.exchange").visual, desc = "Exchange selection", mode = "x", noremap = true },
  { "sxc", require("substitute.exchange").cancel, desc = "Cancel exchange", mode = "n", noremap = true },
})

-- Session management
wk.add({
  {
    "<leader>qs",
    function()
      require("persistence").load()
    end,
    desc = "Restore session",
    mode = "n",
    noremap = true,
  },
  {
    "<leader>qS",
    function()
      require("persistence").select()
    end,
    desc = "Select session",
    mode = "n",
  },
})

-- Formatting
wk.add({
  { "<leader>p", ":RunFormat<CR>", desc = "Format buffer", mode = "n", silent = true },
})

-- Time machine
wk.add({
  { "<leader>u", ":TimeMachineToggle<CR>", desc = "Toggle time machine", mode = "n" },
})

-- Text objects (vim-textobj-entire)
wk.add({
  { "aE", "<Plug>(textobj-entire-a)", desc = "Around entire buffer", mode = { "x", "o" } },
  { "iE", "<Plug>(textobj-entire-i)", desc = "Inside entire buffer", mode = { "x", "o" } },
})

-- vim-cutlass configuration (separate cut and delete)
wk.add({
  { "m", "d", desc = "Cut (delete to register)", mode = { "n", "x" } },
  { "mm", "dd", desc = "Cut line", mode = "n" },
})

-- Buffer management
wk.add({
  { "<leader>B", ":BufOnly<CR>", desc = "Close other buffers", mode = "n" },
})

-- Git operations
wk.add({
  { "<C-g>", ":GV!<CR>", desc = "Git commit browser", mode = "n" },
})

-- Web development
wk.add({
  { "hh", "<Plug>(emmet-expand-abbr)", desc = "Emmet expand abbreviation", mode = "i" },
})

-- Search and replace across files
wk.add({
  { "<leader>s", '<cmd>lua require("spectre").open()<CR>', desc = "Open Spectre", mode = "n" },
  {
    "<leader>c",
    '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    desc = "Search current word",
    mode = "n",
  },
})

-- coc configuration
-- ============================================================================

-- CoC key mappings for LSP functionality
wk.add({
  { "<leader>dr", "<Plug>(coc-references)", desc = "LSP references", mode = "n", silent = true },
  { "<leader>dR", "<Plug>(coc-refactor)", desc = "LSP refactor", mode = "n", silent = true },
  { "<leader>dd", "<Plug>(coc-definition)", desc = "LSP definition", mode = "n", silent = true },
  {
    "<leader>dv",
    ':call CocAction("jumpDefinition", "vsplit")<CR>',
    desc = "LSP definition (vsplit)",
    mode = "n",
    silent = true,
  },
  { "<leader>di", "<Plug>(coc-implementation)", desc = "LSP implementation", mode = "n", silent = true },
  { "<leader>dn", "<Plug>(coc-rename)", desc = "LSP rename", mode = "n", silent = true },
  { "]e", ':call CocAction("diagnosticNext")<CR>', desc = "Next diagnostic", mode = "n", silent = true },
  { "[e", ':call CocAction("diagnosticPrevious")<CR>', desc = "Previous diagnostic", mode = "n", silent = true },
  { "<leader>e", ":CocDiagnostics<CR>", desc = "Diagnostics list", mode = "n", silent = true },
  { "<leader>r", ":CocRestart<CR>", desc = "Restart CoC", mode = "n", silent = true },
})

-- CoC completion mapping
wk.add({
  {
    "<CR>",
    'coc#pum#visible() ? coc#_select_confirm() : "\\<CR>"',
    desc = "Confirm completion",
    mode = "i",
    expr = true,
  },
})

-- Documentation popup
local function show_documentation()
  if vim.bo.filetype == "vim" then
    vim.cmd("help " .. vim.fn.expand("<cword>"))
  else
    vim.fn.CocAction("doHover")
  end
end
wk.add({
  { "K", show_documentation, desc = "Show documentation", mode = "n", silent = true },
})

-- Combined lint fix function - runs appropriate linter based on file type
local function fix_lint_errors()
  local filetype = vim.bo.filetype
  if
    filetype == "javascript"
    or filetype == "javascriptreact"
    or filetype == "typescript"
    or filetype == "typescriptreact"
  then
    vim.cmd("CocCommand eslint.executeAutofix")
  elseif filetype == "css" or filetype == "scss" or filetype == "sass" or filetype == "less" then
    vim.cmd("CocCommand stylelintplus.applyAutoFixes")
  else
    print("No autofix available for filetype: " .. filetype .. ". Use <leader>p for formatting.")
  end
end

-- Which-key registrations for organized help
wk.add({
  { "<leader>f", fix_lint_errors, desc = "Fix lint errors" },
  {
    "<leader>ls",
    function()
      require("persistence").load()
    end,
    desc = "Load session for current dir",
  },
  {
    "<leader>ll",
    function()
      require("persistence").select()
    end,
    desc = "Select a session to load",
  },
})

-- autocommands
-- ============================================================================

-- Fix Enter key behavior in command window
vim.api.nvim_create_autocmd("CmdwinEnter", {
  pattern = "*",
  callback = function()
    wk.add({
      { "<CR>", "<CR>", desc = "Command window enter", mode = "n", noremap = true, buffer = true },
    })
  end,
})
vim.api.nvim_create_autocmd("CmdwinLeave", {
  pattern = "*",
  callback = function()
    wk.add({
      { "<CR>", "o<Esc>", desc = "Insert line below", mode = "n", noremap = true, buffer = true },
    })
  end,
})

-- Help window configuration
vim.api.nvim_create_augroup("vimrc_help", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = "vimrc_help",
  pattern = "*.txt",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd("wincmd L") -- Move help to right side
      vim.opt_local.relativenumber = true -- Show relative numbers in help
    end
  end,
})

-- Cursor line management - hide in inactive windows
vim.api.nvim_create_augroup("CrossHair", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = "CrossHair",
  pattern = "*",
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  group = "CrossHair",
  pattern = "*",
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- File type specific configurations
vim.api.nvim_create_augroup("file_types", { clear = true })

-- JavaScript variants
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "file_types",
  pattern = { "*.snap", "*.es6" },
  callback = function()
    vim.bo.filetype = "javascript.jsx"
  end,
})

-- Configuration files as JSON5
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "file_types",
  pattern = { "*stylelintrc", "*eslintrc", "*babelrc", "*parcelrc", "tsconfig.json" },
  callback = function()
    vim.bo.filetype = "json5"
  end,
})

-- Markdown specific settings
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "file_types",
  pattern = "*.md",
  callback = function()
    vim.opt_local.wrap = true -- Enable line wrapping
    vim.opt_local.linebreak = true -- Break at word boundaries
    vim.opt_local.spell = true -- Enable spell checking
    vim.bo.filetype = "markdown"
  end,
})

-- PHP
vim.api.nvim_create_autocmd("FileType", {
  group = "file_types",
  pattern = "php",
  callback = function()
    vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Git commit message settings
vim.api.nvim_create_autocmd("FileType", {
  group = "file_types",
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.textwidth = 72 -- Wrap at 72 characters
    vim.opt_local.spell = true -- Enable spell checking
  end,
})

-- CSS family language settings
vim.api.nvim_create_autocmd("FileType", {
  group = "file_types",
  pattern = { "css", "scss", "sass" },
  callback = function()
    vim.opt_local.iskeyword:append("-") -- Treat hyphens as part of words
  end,
})

-- Performance optimizations
vim.api.nvim_create_augroup("checktime", { clear = true })
vim.api.nvim_create_autocmd("CursorHold", {
  group = "checktime",
  pattern = "*",
  command = "silent! checktime", -- Check for file changes periodically
})

-- Auto-resize splits when terminal is resized
vim.api.nvim_create_augroup("auto_resize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
  group = "auto_resize",
  pattern = "*",
  command = "wincmd =", -- Equalize window sizes
})

-- Plugin-specific highlights that should persist across colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "CocCodeLens", { fg = "#3a445e" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "#f38ba8" })
    vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#e06c75" })
  end,
})
