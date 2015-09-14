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
      \'y'    : ['#(tmux-mem-cpu-load --interval 2)', '#(ipconfig getifaddr en0)', '#(battery -p -t)'],
      \'z'    : ['%R', '%d-%m-%Y'],
      \'options' : {'status-justify' : 'left'}}


" JS lib syntax
let g:used_javascript_libs = 'underscore,jquery,react,requirejs,jasmine,chai'

" Buf explorer
let g:bufExplorerShowNoName = 1 " Show buffers with no name
