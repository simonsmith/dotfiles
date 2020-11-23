let g:plugin_path = '~/.vscode/nvim/plugged'

call plug#begin(g:plugin_path)

Plug 'tpope/vim-surround'
Plug 'chaoren/vim-wordmotion'
Plug 'svermeulen/vim-easyclip'

call plug#end()

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Set <space> to leader
let mapleader=' '
let maplocalleader='\'

" Briefly move the cursor to the matching brace
set showmatch

" Highlight current line
set cursorline

" Highlight current line
set cursorline

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Line numbers
set number
set relativenumber

" Start scrolling before cursor gets to the edge
set scrolloff=3
set sidescrolloff=15
set sidescroll=1

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Make `Y` work from the cursor to the end of line
nnoremap Y y$

" Press enter for newline without insert
nnoremap <cr> o<esc>
