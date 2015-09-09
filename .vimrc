call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Finding and replacing
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'henrik/vim-qargs'

" Nerdtree
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" Buffers
Plug 'schickling/vim-bufonly'
Plug 'jlanzarotta/bufexplorer'

" Language pack
Plug 'sheerun/vim-polyglot'

" General editing
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'sjl/vitality.vim'
" Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'

" Copy/Paste behaviour
Plug 'svermeulen/vim-easyclip'
Plug 'ConradIrwin/vim-bracketed-paste'

" Sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" HTML/CSS
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'

" Status bar
Plug 'bling/vim-airline'
Plug 'paranoida/vim-airlineish'
Plug 'edkolev/tmuxline.vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Autocomplete
Plug 'jordwalke/AutoComplPop'
Plug 'jordwalke/VimCompleteLikeAModernEditor'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'

" JavaScript
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript.jsx'}
Plug 'mxw/vim-jsx'

call plug#end()

" -----------------------------------------------------------------------------
"  Plugin settings
" -----------------------------------------------------------------------------

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Sessions
let g:session_autosave = 'yes'

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap ss <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

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
let g:syntastic_html_tidy_exec = 'tidy5'

" indentLine
let g:indentLine_char = '|'
let g:indentLine_color_term = 237
let g:indentLine_noConcealCursor="" " Don't mess with JSON concealing
let g:indentLine_faster = 1

" gitgutter
let g:gitgutter_realtime = 100
let g:gitgutter_eager = 100

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

" delimitMate
let delimitMate_expand_cr = 1

" vim-airline
let g:airline_theme = 'airlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" Tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
			\'y'		:[ '#(tmux-mem-cpu-load --interval 2)', '#(battery -p -t)'],
      \'z'    : ['%R', '%d-%m-%Y'],
      \'options' : {'status-justify' : 'left'}}


" JS lib syntax
let g:used_javascript_libs = 'underscore,jquery,react,requirejs,jasmine,chai'

" Buf explorer
let g:bufExplorerShowNoName = 1 " Show buffers with no name

" -----------------------------------------------------------------------------
" Visual
" -----------------------------------------------------------------------------

" Theme
colorscheme gruvbox
set background=dark
syntax on

set colorcolumn=80
set number
set hidden
set autoindent
set copyindent
set showmatch
set lazyredraw
set noshowmode      " don't display the current mode (Insert, Visual, Replace)
                    " in the status line. This info is already shown in the
                    " Airline status bar.
set cursorline
set softtabstop=2
set tabstop=2
set shiftwidth=2
set updatetime=650
set nowrap
set expandtab

set nostartofline
set ruler

" Highlight searches
set hlsearch
set incsearch

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" " Change cursor based on mode
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"" Remember cursor position
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

" Don’t add empty newlines at the end of files
set binary
set noeol

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

" Filetype indentation
filetype plugin indent on

" -----------------------------------------------------------------------------
" Key mappings
" -----------------------------------------------------------------------------
"
" set space to leader
let mapleader = ' '

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
noremap <leader>sp :set spell<cr>
noremap <leader>nsp :set nospell<cr>

" Close buffer
noremap <leader>c :bd<cr>

" Close all but current buffer
noremap <leader>ca :BufOnly

" Gundo
nnoremap <f5> :UndotreeToggle<cr>

" Clear search (highlight)
nnoremap <silent> <leader>k :noh<cr>

" Open new buffers
" Single window
nnoremap <leader>nb :enew<cr>
" Split vertical
nnoremap <leader>nbv :vnew<cr>

nnoremap <leader><space> :BufExplorer<cr>

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

" Git
noremap <leader>gv :Gitv<cr>

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
" manually here. Other directions work fine out the box
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>

" Open .vimrc in a new split
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

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
  " Enable file type detection
  filetype on

  " Resize splits when vim changes size (like with tmux opening/closing)
  autocmd VimResized * wincmd =

  " Force html syntax to be used on html files
  autocmd BufNewFile,BufRead *.html  set syntax=html

  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

  " Spelling in markdown automatically
  autocmd BufRead,BufNewFile *.md setlocal spell

" Move to the top of a git commit
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
endif