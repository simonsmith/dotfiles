" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load all required plugins
if filereadable(expand("~/.vim/.plugin-list.vim"))
  source ~/.vim/.plugin-list.vim
endif

" Configure plugins
if filereadable(expand("~/.vim/.plugin-conf.vim"))
  source ~/.vim/.plugin-conf.vim
endif

" Set space to leader
let mapleader = ' '

" Theme
colorscheme gruvbox
set background=dark
syntax on

" Turn off swapfiles
set noswapfile
set nobackup
set nowb

filetype plugin on
filetype indent on

" Allow editing of binary files
" Must be set before expandtab
" http://stackoverflow.com/a/26901774
set binary

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Line numbers
set number

" With :set hidden, opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed
set hidden
" Briefly move the cursor to the matching brace
set showmatch

" Lazyredraw attempts to solve Vim lag by reducing the amount of
" processing required. When enabled, any action that is not typed
" will not cause the screen to redraw
set lazyredraw

" Don't display the current mode (Insert, Visual, Replace)
" in the status line. This info is already shown in the
" Airline status bar.
set noshowmode

" Highlight current line
set cursorline

" Various settings to control spaces and indents
set smartindent
set cindent
set cino=(0,W4
set softtabstop=2
set shiftwidth=2

set updatetime=650

" Don't wrap lines
set nowrap
" Use spaces, not tabs
set expandtab
" Keep the cursor in the same place when switching buffers
set nostartofline
" Show col and line position in the statusbar
set ruler

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Highlight searches
set hlsearch
set incsearch

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Spell check
set spelllang=en
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast

" Fix background not filling window correctly when moving panes around with
" tmux
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

"Eliminate delay when switching modes
set timeoutlen=1000 ttimeoutlen=0

"Auto save changes before switching buffer
set autowrite
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=.,$TEMP " Stop the swp file warning
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Ignore case of searches
set ignorecase
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Auto reload files on change
set autoread

" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set title
" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Remap annoying mistakes to something useful
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa q
cnoreabbrev Qall qall

" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------
"
" Remap emmet
imap hh <C-y>,

" Save file with <leader>s
nnoremap <leader>w :w<cr>

" Clone paragraph
noremap cp yap<S-}>p

" Make `Y` work from the cursor to the end of line
nnoremap Y y$

" Split
noremap <leader>h :<C-u>split<cr>
noremap <leader>v :<C-u>vsplit<cr>

" Spellcheck
map <F6> :setlocal spell!<cr>

" Close buffer
nnoremap <Leader>q :Bdelete<cr>
nnoremap <leader>qa :bufdo :Bdelete<cr>

" UndoTree
nnoremap <f5> :UndotreeToggle<cr>

" Clear search (highlight)
nnoremap <silent> <leader>k :noh<cr>

" Open new buffers
" Single window
nnoremap <leader>nb :enew<cr>
" Split vertical
nnoremap <leader>nbv :vnew<cr>

nnoremap <leader><space> :BufExplorer<cr>
nnoremap <c-i> :CtrlPBuffer<cr>

" Cycle through buffers
nnoremap <leader>] :bnext<cr>
nnoremap <leader>[ :bprev<cr>

" remap escape to jj
inoremap jj <Esc>`^

" Press enter for newline without insert
nmap <S-Enter> O<Esc>
nmap <cr> o<Esc>

" NERD tree
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader>tt :NERDTreeFind<cr>

" Git tree
noremap <leader>gv :Gitv<cr>

" IndentGuides
" Add this here because this plugin is loaded ondemand so this mapping is not
" present on initial load
nmap <leader>ig :IndentGuidesToggle<cr>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Search with Ack
nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'

" Replace with Qdo
nnoremap <leader>r :Qdo<space> :%s/

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-tmux-navigator seems to have issues with going left, so bind it
" manually here. Other directions work fine out the box
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<cr>

" Automatic commands
if has("autocmd")
  " Resize splits when vim changes size (like with tmux opening/closing)
  autocmd VimResized * wincmd =

  " Force html syntax to be used on html files
  autocmd BufNewFile,BufRead *.html  set syntax=html

  " Wrap text and turn on spell for markdown files
  autocmd BufNewFile,BufRead *.md setlocal wrap linebreak spell filetype=markdown

" Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

" Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Periodically check for file changes
  autocmd CursorHold * silent! checktime

  " Move to the top of a git commit
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
endif