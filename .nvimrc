" Vundle
"*********************

" set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" theme
Plugin 'morhetz/gruvbox'

" Some general plugins
Plugin 'Yggdroot/indentLine'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot' " Language pack
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'ap/vim-css-color'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-surround'
Plugin 'moll/vim-node'
Plugin 'tpope/vim-vinegar'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'mattn/webapi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'henrik/vim-qargs'
Plugin 'schickling/vim-bufonly'

" Status bar
Plugin 'bling/vim-airline'
Plugin 'paranoida/vim-airlineish'
Plugin 'edkolev/tmuxline.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" JavaScript
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1

" indentLine
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" gitgutter
let g:gitgutter_realtime = 200

" ctrlP
" set-up ctrlp to include hidden files in its search
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_height = 30

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore .git -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
endif

" vim-airline
let g:airline_theme = 'airlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Emmet
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/emmet/snippets.json')), "\n"))

" Visual
"*********************

colorscheme gruvbox
set background=dark
set colorcolumn=80
syntax on
set number
set hidden
set autoindent
set copyindent
set showmatch
set cursorline
set softtabstop=2
set shiftwidth=2
set updatetime=650
set expandtab
set nowrap
" JSON should have quotes
set conceallevel=0
set nostartofline
set ruler
" Highlight searches
set hlsearch
set incsearch
" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·
" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" General
"*********************

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Spell checking
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
" Auto save changes before switching buffer
set autowrite
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.nvim/backups
set directory=.,$TEMP
if exists("&undodir")
  set undodir=~/.nvim/undo
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
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Auto reload files on change
set autoread
au CursorHold * checktime
" No swapfiles
set noswapfile
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Mappings
" ********************
"
" Save file with <leader>s
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

" Clone paragraph
noremap cp yap<S-}>p

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Spellcheck
noremap <Leader>sp :set spell<cr>
noremap <Leader>nsp :set nospell<cr>

" Close buffer
noremap <leader>c :bd<CR>

" Close all but current buffer
noremap <leader>ca :BufOnly

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Use tab to navigate brackets
nnoremap <tab> %
vnoremap <tab> %

" Open new buffers
" Single window
nnoremap <leader>nb :enew<cr>
" Split vertical
nnoremap <leader>nbv :vnew<cr>

" remap escape to jj
inoremap jj <Esc>`^

" Press enter for newline without insert
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Search with Ack
nnoremap <leader>a :Ack!<space>
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'

" Replace with Qdo
nnoremap <leader>r :Qdo<space> :%s/

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" vim-tmux-navigator seems to have issues with going left, so bind it
" manually here
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>

" Open .nvimrc in a new split
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  "autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Save all on focus lost
  au FocusLost * :wa
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  " Spelling in markdown automatically
	autocmd BufRead,BufNewFile *.md setlocal spell
endif

" Move to the top of a git commit
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])