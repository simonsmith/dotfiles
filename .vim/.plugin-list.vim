
call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Finding and replacing
Plug 'mileszs/ack.vim'
Plug 'henrik/vim-qargs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Nerdtree
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" Buffers
Plug 'schickling/vim-bufonly'
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'wesQ3/vim-windowswap'

" Language pack
Plug 'sheerun/vim-polyglot'

" Editing
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'

" General
Plug 'editorconfig/editorconfig-vim'
Plug 'sjl/vitality.vim'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'regedarek/ZoomWin'
Plug 'embear/vim-localvimrc'

" Refactoring
Plug 'terryma/vim-multiple-cursors'
Plug 'PeterRincker/vim-argumentative'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'

" Copy/Paste behaviour
Plug 'svermeulen/vim-easyclip'
Plug 'ConradIrwin/vim-bracketed-paste'

" Sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" HTML/CSS
Plug 'ap/vim-css-color', {'for': 'css'}
Plug 'mattn/emmet-vim'

" Status bar
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Autocomplete
Plug 'jordwalke/AutoComplPop'
Plug 'jordwalke/VimCompleteLikeAModernEditor'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" JavaScript
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'sheerun/yajs.vim'
Plug 'mxw/vim-jsx'

call plug#end()